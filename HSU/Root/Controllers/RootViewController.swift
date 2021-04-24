import UIKit


class RootViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButtons()
        
    }
    
    func configureButtons() {
        
        self.loginButton.backViewShadow(cornerRadius: 8)
        self.signUpButton.backViewShadow(cornerRadius: 8)
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(SignUpViewController(nibName: "SignUpViewController", bundle: nil), animated: true)
    }
}
