//
//  UserModel.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import RealmSwift

class UserModel: Object,Codable {
    @Persisted(primaryKey: true) var userId: String = UUID().uuidString
    @Persisted var status:String = ""
    @Persisted var message:String = ""
    @Persisted var designation:String = ""
    @Persisted var empName:String = ""
    @Persisted var locCode:String = ""
    @Persisted var locName:String = ""
    @Persisted var depotName:String = ""
    
    enum CodingKeys:String,CodingKey {
        case status = "Status"
        case message = "Message"
        case designation = "Designation"
        case empName = "EmpName"
        case locCode = "LocCode"
        case locName = "LocName"
        case depotName = "DepotName"
    }
    
    override init() {
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
