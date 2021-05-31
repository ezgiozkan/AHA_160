//
//  RemindersViewController.swift
//  HSU
//
//  Created by ezgi on 22.05.2021.
//

import UIKit
import CoreData


class RemindersViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    var reminderList : [Reminder]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureNavBar()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        getAllReminder()
    }
    
    func configureTableView() {
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(UINib(nibName: "ReminderTableViewCell", bundle: nil), forCellReuseIdentifier: "reminderCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
   
    
    func configureNavBar() {
            
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.topItem?.title = "Hatırlatıcılar"
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(addReminder))
        navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    
    }
   
    @objc func addReminder() {
        
        self.navigationController?.pushViewController(ChosenReminderViewController(nibName: "ChosenReminderViewController", bundle: nil), animated: true)
    }


}

extension RemindersViewController: UITableViewDelegate, UITableViewDataSource {
    
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
