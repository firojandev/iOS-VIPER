//
//  DashboardViewController.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 28/5/24.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var presenter:DashboardViewToPresenter?
    
    
    @IBOutlet weak var dateToday: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        self.title = "Dashboard"
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor.systemBlue
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            navigationBar.tintColor = UIColor.blue
        }
        let logoutButtonItem = UIBarButtonItem(image:UIImage(named:"LogoutIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logoutButtonTapped))
        
        let notificationButtonItem = UIBarButtonItem(image:UIImage(named:"NotificationIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(notificationButtonTapped))
        let settingButtonItem = UIBarButtonItem(image:UIImage(named:"SettingsIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(settingButtonTapped))
       
        let menuBarButtonItem = UIBarButtonItem(image:UIImage(named:"MenuIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [menuBarButtonItem,settingButtonItem,notificationButtonItem,logoutButtonItem,]
    }
    
    @objc func logoutButtonTapped() {
        presenter?.didTappedLogoutButton()
        print("Logout clicked")
    }
    
    @objc func notificationButtonTapped() {
        //presenter?.didTapNext()
        print("Notifications clicked")
    }
    @objc func settingButtonTapped() {
        //presenter?.didTapNext()
        print("Settings clicked")
    }
    
    @objc func menuButtonTapped() {
        //presenter?.didTapNext()
        print("Menu clicked")
    }
    
}

extension DashboardViewController: UINavigationBarDelegate {
    
}

extension DashboardViewController: DashboardPresenterToView {
    
    func displayDate(_ formattedDate: String) {
        dateToday.text = formattedDate
    }
    
    
}
