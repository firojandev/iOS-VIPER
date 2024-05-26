//
//  AuthViewController.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import UIKit

class AuthViewController: UIViewController {
    
    var presenter: ViewToPresenterAuthModuleProtocol?
    
    
    
    
    @IBAction func login(_ sender: UIButton) {
        presenter?.didPerformedLoginOperation(userId: "RM1", userPassword: "RM1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
