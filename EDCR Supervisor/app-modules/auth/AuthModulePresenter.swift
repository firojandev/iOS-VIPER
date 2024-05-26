//
//  AuthModulePresenter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//  
//

import Foundation

class AuthModulePresenter: ViewToPresenterAuthModuleProtocol {
    
    var presenter: PresenterToViewAuthModuleProtocol?
    
    // MARK: Properties
    var view: PresenterToViewAuthModuleProtocol?
    var interactor: PresenterToInteractorAuthModuleProtocol?
    var router: PresenterToRouterAuthModuleProtocol?
    
    var userModel:UserModel? = nil
    
    func didPerformedLoginOperation(userId: String, userPassword: String) {
        interactor?.login(userId: userId, userPassword: userPassword)
    }
    

}

extension AuthModulePresenter: InteractorToPresenterAuthModuleProtocol {
    func didSuccessUserLogin(response: UserModel) {
        self.userModel = response
        print(response)
        view?.didLoginSuccess(message: "Welcome \(self.userModel?.empName)")
        
    }
    
    func didFailedUserLogin(error: String) {
        view?.didLoginSuccess(message: error)
    }
    
    

    
}
