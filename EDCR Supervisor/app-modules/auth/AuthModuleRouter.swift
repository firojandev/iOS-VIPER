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
   
    func navigateToDashboard(from view: PresenterToViewAuthModuleProtocol, userModel: UserModel) {
        
        guard let view = view as? UIViewController else  {  return  }
        
        let dashboardRouter = DashboardRouter()
        let dashboardViewController = dashboardRouter.createDashboardScreen()
        view.navigationController?.pushViewController(dashboardViewController, animated: true)
    }
    
}
