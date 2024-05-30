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
    
    func checkDidLoggedIn() {
        let allUsers = StorageManager.shared.getAllObjects(UserModel.self)
        print("total Users: \(allUsers.count)")
        
        if let loggedUser = allUsers.first {
            presenter?.checkDidAlreadyLoggedIn(user: loggedUser)
        }
        
    }
    
    
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
        
        //Clear already saved user model
        StorageManager.shared.deleteUserModel()
        
        //Saving this user model to the db
        StorageManager.shared.saveObject(response)
        
        presenter?.didSuccessUserLogin(response: response)
    }
    
    func didFailedLogin(error: String) {
        presenter?.didFailedUserLogin(error: error)
    }
    
    
}

