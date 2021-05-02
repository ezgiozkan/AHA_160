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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers#imageLiteral(resourceName: "simulator_screenshot_0E9630C1-5A0D-487B-B129-3CCDFB4551C1.png")
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
