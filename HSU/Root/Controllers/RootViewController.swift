import UIKit


class RootViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 3.0
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginButton.layer.shadowColor = UIColor.black.cgColor
        signupButton.layer.cornerRadius = 10
      
       
        
        
        
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        print("xxx")
        self.navigationController?.pushViewController(SignUpViewController(nibName: "SignUpViewController", bundle: nil), animated: true)
    }
    
    
    
}
