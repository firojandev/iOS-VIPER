//
//  DashboardContract.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation
import UIKit

protocol DashboardViewToPresenter: AnyObject {
    var view: DashboardPresenterToView? {get set}
    var interactor: DashboardPresenterToInteractor? {get set}
    var router: DashboardPresenterToRouter? {get set}
    
    func viewDidLoad()
}

protocol DashboardPresenterToView: AnyObject {
    var presenter:DashboardViewToPresenter? {get set}
    
    func displayDate(_ formattedDate: String)
}

protocol DashboardPresenterToInteractor: AnyObject {
    var presenter:DashboardInteractorToPresenter? {get set}
    
    func fetchCurrentDate()
}

protocol DashboardInteractorToPresenter: AnyObject {
    func didFetchDate(_ date: Date)
}

protocol DashboardPresenterToRouter: AnyObject {
    func createDashboardScreen()-> UIViewController
}


