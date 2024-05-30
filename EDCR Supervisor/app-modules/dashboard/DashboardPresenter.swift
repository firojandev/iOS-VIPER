//
//  DashboardPresenter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation
import UIKit

class DashboardPresenter {
    var view: DashboardPresenterToView?
    var interactor: DashboardPresenterToInteractor?
    var router: DashboardPresenterToRouter?
}


extension DashboardPresenter: DashboardViewToPresenter {
    
    func viewDidLoad() {
        interactor?.fetchCurrentDate()
    }
    
    func didTappedLogoutButton() {
        interactor?.didTapLogoutButton()
    }
    
}

extension DashboardPresenter: DashboardInteractorToPresenter {
    
    func didLogout() {
        // Now navigate to logui UI
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            print("Error: Could not retrieve the main window.")
            return
            
        }
       // weak var viewController: UIViewController?
        
        let authRouter = AuthModuleRouter()
        let authViewController = authRouter.createAuthScreen()
        let navigationController = UINavigationController(rootViewController: authViewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // Optionally, animate the transition
        UIView.transition(with: window, duration: 0.5, options: .curveEaseOut, animations: nil, completion: nil)
    }
    
    func didFetchDate(_ date: Date) {
        
        let strDate = date.formattedString()
        view?.displayDate(strDate)
    }
    
    
    
}
