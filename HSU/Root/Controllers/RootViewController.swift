import UIKit


class RootViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButtons()
        
    }
    
    func configureButtons() {
        
        self.loginButton.layer.cornerRadius = 8
        self.loginButton.addShadow(shadowColor: .black, radius: 4, opacity: 0.4)
        
        self.signupButton.layer.cornerRadius = 8
        self.signupButton.addShadow(shadowColor: .black, radius: 4, opacity: 0.4)
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(SignUpViewController(nibName: "SignUpViewController", bundle: nil), animated: true)
    }
}
