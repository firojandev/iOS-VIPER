//
//  DashboardPresenter.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation

class DashboardPresenter {
    var view: DashboardPresenterToView?
    var interactor: DashboardPresenterToInteractor?
    var router: DashboardPresenterToRouter?
}


extension DashboardPresenter: DashboardViewToPresenter {
    
    func viewDidLoad() {
        interactor?.fetchCurrentDate()
    }
    
    
}

extension DashboardPresenter: DashboardInteractorToPresenter {
    func didFetchDate(_ date: Date) {
        
        let strDate = date.formattedString()
        view?.displayDate(strDate)
    }
    
    
    
}
