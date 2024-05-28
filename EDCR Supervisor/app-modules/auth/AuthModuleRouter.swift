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
   
//    func navigateToDashboard(from view: PresenterToViewAuthModuleProtocol, userModel: UserModel) {
//
//        guard let view = view as? UIViewController else  {  return  }
//
//        let dashboardRouter = DashboardRouter()
//        let dashboardViewController = dashboardRouter.createDashboardScreen()
//        view.navigationController?.pushViewController(dashboardViewController, animated: true)
//    }
    
    weak var viewController: UIViewController?
    
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
