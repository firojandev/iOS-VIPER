//
//  NetworkManager.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    static let baseUrl = ""
    
    func requestUrl(url:String) -> String {
        return NetworkHelper.baseUrl + "/DCRService.svc/Json/\(url)"
    }
    
}
