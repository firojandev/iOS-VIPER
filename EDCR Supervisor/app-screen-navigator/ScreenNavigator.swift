//
//  ScreenNavigator.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 23/5/24.
//

import Foundation
import UIKit

class ScreemNavigator {
    
    public static let shared = ScreemNavigator()
           
       func createAuthScreen() -> UIViewController {
           
           var view: UIViewController & PresenterToViewAuthModuleProtocol = AuthViewController()
           var presenter: ViewToPresenterAuthModuleProtocol & InteractorToPresenterAuthModuleProtocol = AuthModulePresenter()
           var interactor: PresenterToInteractorAuthModuleProtocol = AuthModuleInteractor()
           var router: PresenterToRouterAuthModuleProtocol = AuthModuleRouter()
           
           view.presenter = presenter
           presenter.view = view
           presenter.interactor = interactor
           presenter.router = router
           interactor.presenter = presenter
           
           return view
       }
       
    
}
