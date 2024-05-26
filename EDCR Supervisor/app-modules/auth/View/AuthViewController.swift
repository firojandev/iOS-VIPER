//
//  AuthViewController.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import UIKit

class AuthViewController: UIViewController {
    
    var presenter: ViewToPresenterAuthModuleProtocol?
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var inputUserID: UITextField!
    
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBAction func login(_ sender: UIButton) {
        
        let userId = inputUserID.text
        let userPassword = inputPassword.text
        
        guard let userId = userId, !userId.isEmpty, let userPassword = userPassword, !userPassword.isEmpty else {
            showAlert(message: "Please enter both UserID and Password.")
            return
        }
        
        print("UserID:\(userId), userPassword:\(userPassword)")
    
        presenter?.didPerformedLoginOperation(userId: userId, userPassword: userPassword)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
    }

}

extension AuthViewController: PresenterToViewAuthModuleProtocol {
    func didLoginSuccess(message: String) {
       print("Success \(message)")
    }
    
    func didLoginFailed(error: String) {
       print("Error \(error)")
    }
    
    
}
