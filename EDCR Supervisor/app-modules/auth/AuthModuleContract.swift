//
//  AuthModuleContract.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAuthModuleProtocol: AnyObject {
       
    var presenter: ViewToPresenterAuthModuleProtocol? {get set}
    
    func didLoginSuccess(message:String)
    func didLoginFailed(error:String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAuthModuleProtocol: AnyObject {

    var view: PresenterToViewAuthModuleProtocol? { get set }
    var interactor: PresenterToInteractorAuthModuleProtocol? { get set }
    var router: PresenterToRouterAuthModuleProtocol? { get set }
    
    func didPerformedLoginOperation(userId:String,userPassword:String)
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAuthModuleProtocol {
    
    var presenter: InteractorToPresenterAuthModuleProtocol? { get set }
    func login(userId:String, userPassword:String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAuthModuleProtocol {
    func didSuccessUserLogin(response: UserModel)
    func didFailedUserLogin(error: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAuthModuleProtocol : AnyObject {
   func navigateToDashboard(from: PresenterToViewAuthModuleProtocol, userModel: UserModel)
}
