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

    }

}

extension DashboardViewController: DashboardPresenterToView {
    
    func displayDate(_ formattedDate: String) {
        dateToday.text = formattedDate
    }
    
    
}
