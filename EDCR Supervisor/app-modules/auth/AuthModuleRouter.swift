//
//  AuthModuleRouter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//  
//

import Foundation
import UIKit

class AuthModuleRouter: PresenterToRouterAuthModuleProtocol {
    
    weak var viewController: UIViewController?
    
//    func navigateToDashboard(from view: PresenterToViewAuthModuleProtocol, userModel: UserModel) {
//
//        guard let view = view as? UIViewController else  {  return  }
//
//        let dashboardRouter = DashboardRouter()
//        let dashboardViewController = dashboardRouter.createDashboardScreen()
//        view.navigationController?.pushViewController(dashboardViewController, animated: true)
//    }
    
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
   
    func navigateToDashboard(from view: PresenterToViewAuthModuleProtocol, userModel: UserModel) {
        
        //As we wish to replace the login UI with dashboard UI as root view
        
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            print("Error: Could not retrieve the main window.")
            return
            
        }
        
        let dashboardRouter = DashboardRouter()
        let dashboardViewController = dashboardRouter.createDashboardScreen()
        let navigationController = UINavigationController(rootViewController: dashboardViewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // Optionally, animate the transition
        UIView.transition(with: window, duration: 0.5, options: .curveEaseIn, animations: nil, completion: nil)
        
    }
    
}
