//
//  SettingsViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 25.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var backView: UIView!
    
    let options: [String] = [
        
        "Sıkça Sorulan Sorular",
        "Hesap",
        "Hakkımızda",
        "Gizlilik Sözleşmesi",
        "Kullanım Şartları",
        "Çıkış Yap",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //NavBar title
        self.navigationController?.navigationBar.topItem?.title = "Ayarlar"
        
        configureBackView()
        configureTableView()
    }

    func configureTableView() {
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func configureBackView() {
        
        self.backView.backViewShadow(cornerRadius: 8)
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = self.options[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print(self.options[0])
        case 1:
            print(self.options[1])
        case 2:
            print(self.options[2])
        case 3:
            print(self.options[3])
        case 4:
            print(self.options[4])
        case 5:
            
            let alert = UIAlertController(title: "Uyarı!", message: "Çıkış yapmak istediğinizden emin misiniz?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "İptal", style: .destructive, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                
                UserDefaults.standard.setValue(nil, forKey: "token")
                
                self.dismiss(animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        default:
            print("")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
    }
}
