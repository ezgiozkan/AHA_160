//
//  RootViewController.swift
//  HSU
//
//  Created by ezgi on 13.03.2021.
//

import UIKit

@available(iOS 13.0, *)
class RootViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    let rootImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let imageView2: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "img2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.9843619466, green: 0.777361691, blue: 0.3570454121, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 3.0
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginButton.layer.shadowColor = UIColor.black.cgColor
        signupButton.layer.cornerRadius = 10
      
        view.addSubview(descriptionTextView)
        
         firstLoad()
        
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        print("xxx")
        self.navigationController?.pushViewController(SignUpViewController(nibName: "SignUpViewController", bundle: nil), animated: true)
    }
    
    
    func firstLoad(){
        
        let topContainerView = UIView()
      
        view.addSubview(topContainerView)
      
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        topContainerView.addSubview(rootImageView)
        
        rootImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        rootImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        rootImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
          
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        
        let pageControlsStackView = UIStackView(arrangedSubviews: [pageControl])
        pageControlsStackView.translatesAutoresizingMaskIntoConstraints  = false
        pageControlsStackView.distribution = .equalCentering
        view.addSubview(pageControlsStackView)
        
        NSLayoutConstraint.activate([
        
            pageControlsStackView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 140),
            pageControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            pageControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
        
        
        
        ])
        

        /*let bottomControlsStackView = UIStackView(arrangedSubviews: [loginButton,imageView2,createAccountButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
           
            ])*/
        
 
   
        
        
    }

   

    
   

}
