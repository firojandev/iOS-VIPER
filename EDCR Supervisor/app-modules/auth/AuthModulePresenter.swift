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
    
    func viewDidLoad() {
        interactor?.checkDidLoggedIn()
    }
    
    func didPerformedLoginOperation(userId: String, userPassword: String) {
        interactor?.login(userId: userId, userPassword: userPassword)
    }
    

}

extension AuthModulePresenter: InteractorToPresenterAuthModuleProtocol {
    func checkDidAlreadyLoggedIn(user userModel: UserModel) {
        print(userModel)
        router?.navigateToDashboard(from:view!,userModel: userModel)
    }
    
    func didSuccessUserLogin(response: UserModel) {
        self.userModel = response
       
        print(response)
        
        router?.navigateToDashboard(from:view!,userModel: userModel!)
        
    }
    
    func didFailedUserLogin(error: String) {
        view?.didLoginFailed(error:error)
        
    }

}
