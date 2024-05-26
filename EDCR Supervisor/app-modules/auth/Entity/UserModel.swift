//
//  UserModel.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import Foundation

struct UserModel: Codable {
    let status:String
    let message:String
    let designation:String
    let empName:String
    let locCode:String
    let locName:String
    let depotName:String
    
    enum CodingKeys:String,CodingKey {
        case status = "Status"
        case message = "Message"
        case designation = "Designation"
        case empName = "EmpName"
        case locCode = "LocCode"
        case locName = "LocName"
        case depotName = "DepotName"
    }
    
    init(status: String, message: String, designation: String, empName: String, locCode: String, locName: String, depotName: String) {
        self.status = status
        self.message = message
        self.designation = designation
        self.empName = empName
        self.locCode = locCode
        self.locName = locName
        self.depotName = depotName
    }
    
}
