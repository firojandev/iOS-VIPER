//
//  AuthModuleInteractor.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//  
//

import Foundation

class AuthModuleInteractor {
    // MARK: Properties
    var presenter: InteractorToPresenterAuthModuleProtocol?
    var service:NetworkService?
    let networkManager = LoginService.shared
}

extension AuthModuleInteractor: PresenterToInteractorAuthModuleProtocol {
    
    func login(userId:String,userPassword password:String) {
        networkManager.getLogin(userId: userId, password: password) {userModel, error in
                   if let error = error {
                       self.didFailedLogin(error: error.localizedDescription)
                   } else {
                       if let userModel = userModel {
                           self.didSuccessLogin(response: userModel)
                       }
                   }
               }
    }
    

}

extension AuthModuleInteractor: UserLoginProtocal {
    func didSuccessLogin(response: UserModel) {
        presenter?.didSuccessUserLogin(response: response)
    }
    
    func didFailedLogin(error: String) {
        presenter?.didFailedUserLogin(error: error)
    }
    
    
}

