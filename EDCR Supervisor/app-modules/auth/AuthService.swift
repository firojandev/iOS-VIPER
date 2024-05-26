//
//  AuthService.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import Foundation

protocol LoginServiceProtocol {
    func getLogin(userId: String, password: String,completion: @escaping((UserModel?, Error?)->()))
}

protocol UserLoginProtocal: AnyObject {
    func didSuccessLogin(response:UserModel)
    func didFailedLogin(error: String)
}

class LoginService: LoginServiceProtocol {
    
    static let shared = LoginService()
    
    var userLoginProtocall: UserLoginProtocal?
    
    func getLogin(userId: String, password: String,completion: @escaping ((UserModel?, Error?) -> ())) {
        
        let url = NetworkHelper.shared.requestUrl(url: "/login?UserID=\(userId)&Password=\(password)&Token=ABCD")
        
        NetworkService.shared.request(type: UserModel.self,url: url,method: .get) {
            response in
            switch response {
            case .success(let userModel):completion(userModel, nil)
            case .failure(let error):completion(nil, error)
            }
            }
        }
    
}
