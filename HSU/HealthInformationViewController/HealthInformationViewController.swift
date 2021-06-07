//
//  HealthInformationViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 7.05.2021.
//

import UIKit
import Kingfisher

class HealthInformationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    var currentPets = [(Int,String)]()
    var healthInfoResponse = [HealthInformation]()
    var haveHealthInfoAnimals: [String] = []
    var refreshControl: UIRefreshControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHealthInformation { (healthInformation) in
            self.healthInfoResponse = healthInformation
        }
        configureTableView()
        configureNavBar()
        
        print(currentPets)
        
    }
    
    func configureTableView() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "HealthInformationTableViewCell", bundle: nil), forCellReuseIdentifier: HealthInformationTableViewCell.cellIdentifier)
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func configureNavBar() {
        self.navigationController?.navigationBar.topItem?.title = "Sağlık Bilgileri"
    }
    
    func getHealthInformation(completion: @escaping ([HealthInformation]) ->()) {
        
        self.healthInfoResponse.removeAll(keepingCapacity: false)
        
        for currentPetId in self.currentPets {
            Network.shared.getHealthInformation(currentPetId: currentPetId.0) { (result) in
                switch result {
                case .success(let healthInfoResponse):
                    
                    for response in healthInfoResponse {
                        self.healthInfoResponse.append(response)
                        
                        for currentPet in self.currentPets {
                            if currentPet.0 == response.animalId {
                                self.haveHealthInfoAnimals.append(currentPet.1)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @objc func refresh(_ sender: Any) {
        
        getHealthInformation { (healthInformation) in
            self.healthInfoResponse = healthInformation
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.refreshControl.endRefreshing()
        }
    }
}

extension HealthInformationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.healthInfoResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HealthInformationTableViewCell.cellIdentifier, for: indexPath) as? HealthInformationTableViewCell else { return UITableViewCell() }
    
        cell.titleLabel.text = self.healthInfoResponse[indexPath.row].title
        cell.subTitleLabel.text = self.healthInfoResponse[indexPath.row].subtitle
        cell.healthInfoDescription.text = self.healthInfoResponse[indexPath.row].description
        cell.dateAdded.text = String(self.healthInfoResponse[indexPath.row].dateAdded.split(separator: "T").first ?? "").replacingOccurrences(of: "-", with: "/")
        cell.animalName.text = self.haveHealthInfoAnimals[indexPath.row]
        
       let url = URL(string: "\(self.healthInfoResponse[indexPath.row].url)")
        cell.healthInfoImage.kf.setImage(with: url)
        
        tableView.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
}

extension HealthInformationViewController: HomeViewControllerDelegateOutput {
    func currentPetIds(petIds: [Int]) {
        print("Here")
        print(petIds)
    }
    
}
