//
//  HomeViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 12.03.2021.
//

import UIKit
import CoreData

protocol HomeViewControllerDelegateOutput: class {
    func currentPetIds(petIds: [Int])
}

class HomeViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var petsCollectionView: UICollectionView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    var petsCollectionViewDataSource: PetsCollectionViewDataSource?
    var servicesCollectionViewDataSource: ServicesCollectionViewDataSource?
    
    var petsCollectionViewDelegate: PetsCollectionViewDelegate?
    var servicesCollectionViewDelegate: ServicesCollectionViewDelegate?
    
    var viewModel: PetsCollectionViewModel?
    
    @IBOutlet weak var seeAll: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: HomeViewControllerDelegateOutput?
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let borderColor = UIColor(red: 254 / 255, green: 203 / 255, blue: 85 / 255, alpha: 1.0)
        }
    }
    
    var windowWidth: CGFloat?{
        return UIScreen.main.bounds.width - 25
    }
    
    var currentPets = [(Int,String)]()
    var petIds: [String] = []
    var reminderList : [Reminder]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureImageView()
        getPets { (viewModel) in
            
            self.viewModel = viewModel
            
            for res in viewModel.responseModel! {
                self.currentPets.append((res.id,res.name))
            }
            
            DispatchQueue.main.async {
                if let tabBarVC = self.navigationController?.tabBarController as? TabBarController {
                    let healhInfoVC = tabBarVC.item2.viewControllers[0] as? HealthInformationViewController
                    healhInfoVC?.currentPets = self.currentPets
                }
                self.configureCollectionViews()
            }
        }
        
        print(UserDefaults.standard.string(forKey: "currentUserEmail") ?? "boşMail")
    }
    
    
    func getPets(completion: @escaping (PetsCollectionViewModel) ->()) {
        
        let userId = UserDefaults.standard.integer(forKey: "currentUserId")

        Network.shared.getPet(userId: userId) { (result) in
            
            switch result {
            
            case .success(let responseModel):
                
                let viewModel = PetsCollectionViewModel(responseModel: responseModel)
                completion(viewModel)
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
            }
        }

    }
    
    func configureImageView() {
        
        imageView.image = #imageLiteral(resourceName: "face")
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = Constants.Color.borderColor.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    func configureCollectionViews() {
        
        self.petsCollectionViewDelegate = PetsCollectionViewDelegate(outputDelegate: self)
        
        if let viewModel = self.viewModel {
           
            self.petsCollectionViewDataSource = PetsCollectionViewDataSource(viewModel: viewModel)
        }
        
        self.petsCollectionView.dataSource = self.petsCollectionViewDataSource
        self.petsCollectionView.delegate = self.petsCollectionViewDelegate
        
        self.petsCollectionView.register(UINib(nibName: "PetsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PetsCollectionViewCell.cellIdentifier)
        
       
       self.servicesCollectionViewDataSource = ServicesCollectionViewDataSource()
        self.servicesCollectionViewDelegate = ServicesCollectionViewDelegate(width: self.windowWidth ?? 0.0)
        
        /*  self.servicesCollectionView.dataSource = self.servicesCollectionViewDataSource
        self.servicesCollectionView.delegate = self.servicesCollectionViewDelegate
        
        self.servicesCollectionView.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ServicesCollectionViewCell.cellIdentifier)*/
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getAllReminder()
        // Hide the navigation bar on the this view controller
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        getPets { (viewModel) in
            
            self.viewModel = viewModel
            
            DispatchQueue.main.async {
                
                self.configureCollectionViews()
            }
        }
        
    }
    
    func configureTableView() {
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(UINib(nibName: "ReminderTableViewCell", bundle: nil), forCellReuseIdentifier: "reminderCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func seeAll(_ sender: Any) {
        self.navigationController?.pushViewController(RemindersViewController(nibName: "RemindersViewController", bundle: nil), animated: true)
    }
    
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}


extension HomeViewController: PetsCollectionViewDelegateOutput {
    func didSelect(indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let addPetVC = AddPetViewController(nibName: "AddPetViewController", bundle: nil)
            addPetVC.outputDelegate = self
            
            self.navigationController?.pushViewController(addPetVC, animated: true)
            
        }else{
            
            let petDetailVC = PetDetailViewController(nibName: "PetDetailViewController", bundle: nil)
            petDetailVC.selectedIndexPathRow = indexPath.row
            petDetailVC.viewModel = self.viewModel
            
            self.navigationController?.pushViewController(petDetailVC, animated: true)
        }
    }
}

extension HomeViewController: AddPetOutputDelegate {
    
    func petIds(id: Int) {
        
        var nums = UserDefaults.standard.array(forKey: "nums") ?? []
        nums.append(id)
        UserDefaults.standard.set(nums, forKey: "nums")
        
        print(UserDefaults.standard.array(forKey: "nums")!)
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if reminderList != nil {
            return reminderList!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as? ReminderTableViewCell else { return UITableViewCell() }
        
      cell.rTitleLabel.text = reminderList![indexPath.row].reminderType
        
        if cell.rTitleLabel.text == "Vaccine" {
            cell.imgReminder.image = UIImage(named:"vaccineImg")
        }else if cell.rTitleLabel.text == "Vet Visit"
        {
            cell.imgReminder.image = UIImage(named:"stethoscope")
        }else{
            cell.imgReminder.image = UIImage(named:"dog-food")
        }
        
        cell.dtitleLabel.text = reminderList![indexPath.row].reminderDate
        cell.petName.text = reminderList![indexPath.row].petName
       //cell.imgReminder.image = #imageLiteral(resourceName: "foodImg")
       
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(reminderList![indexPath.row])
            
            do{
                
                try(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
                    
                tableView.reloadData()
                getAllReminder()
            }catch let error as NSError{
                print("error \(error)")
            }
        }
    }
    
    
    
    func getAllReminder(){
        
        let fetchRequest : NSFetchRequest<Reminder> = Reminder.fetchRequest()
        
        do{
        
            reminderList = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            tableView.reloadData()
           
        }
        catch{
            
        }
    }
}
