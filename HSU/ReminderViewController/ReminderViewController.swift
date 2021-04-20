//
//  ReminderViewController.swift
//  HSU
//
//  Created by ezgi on 7.04.2021.
//

import UIKit

class ReminderViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var btnVaccine: UIButton!
    @IBOutlet weak var btnVisit: UIButton!
    @IBOutlet weak var btnDrugs: UIButton!
    @IBOutlet weak var btnFood: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationButtons()
        self.view.backgroundColor = .darkGray
    }


    
    //MARK: CONFİGURATİONS
    
    func configurationButtons(){
        
        btnVaccine.layer.cornerRadius = btnVaccine.frame.size.height/2
        btnVisit.layer.cornerRadius = btnVisit.frame.size.height/2
        btnDrugs.layer.cornerRadius = btnDrugs.frame.size.height/2
        btnFood.layer.cornerRadius = btnFood.frame.size.height/2
    }

}
