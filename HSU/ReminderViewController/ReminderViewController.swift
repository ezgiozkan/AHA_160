//
//  ReminderViewController.swift
//  HSU
//
//  Created by ezgi on 7.04.2021.
//

import UIKit

class ReminderViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var reminderCollectionView: UICollectionView!
    
    var reminderCollectionViewDataSource: ReminderCollectionViewDataSource?
    var reminderCollectionViewDelegate: ReminderCollectionViewDelegate?
    
    var windowWidth: CGFloat?{
        
        return UIScreen.main.bounds.width - 25
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionViews()
        configureNavBar()
    }
    
    
    //MARK: - Configurations
    func configureCollectionViews() {

            self.reminderCollectionViewDataSource = ReminderCollectionViewDataSource()
            self.reminderCollectionViewDelegate = ReminderCollectionViewDelegate(width: self.windowWidth ?? 0.0)
            
            self.reminderCollectionView.dataSource = self.reminderCollectionViewDataSource
            self.reminderCollectionView.delegate = self.reminderCollectionViewDelegate
            
            self.reminderCollectionView.register(UINib(nibName: "ReminderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReminderCollectionViewCell.cellIdentifier)
        
    }
    
    
    func configureNavBar() {
            
        self.view.backgroundColor = .white
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


