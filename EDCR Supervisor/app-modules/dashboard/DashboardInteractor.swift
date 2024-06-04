//
//  DashboardInteractor.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import Foundation

class DashboardInteractor {
    var presenter: DashboardInteractorToPresenter?
}

extension DashboardInteractor: DashboardPresenterToInteractor {
    
    func didTapLogoutButton() {
       
        //Logout
        //Clear already saved user model
        StorageManager.shared.deleteUserModel()
        
        //Navigate ot the login page now
        presenter?.didLogout()

    }
    
    func fetchCurrentDate() {
        let currentDate = Date()
        presenter?.didFetchDate(currentDate)
    }
    
}
