//
//  DashboardRouter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation
import UIKit

class DashboardRouter: DashboardPresenterToRouter {
    
    func createDashboardScreen() -> UIViewController {
       
        var view: UIViewController & DashboardPresenterToView = DashboardViewController()
        var presenter: DashboardViewToPresenter & DashboardInteractorToPresenter = DashboardPresenter()
        var interactor: DashboardPresenterToInteractor = DashboardInteractor()
        var router: DashboardPresenterToRouter = DashboardRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}
