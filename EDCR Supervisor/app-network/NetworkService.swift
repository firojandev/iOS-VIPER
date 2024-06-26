//
//  NetworkService.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 22/5/24.
//

import Foundation
import Alamofire

struct NetworkService {
    static let shared = NetworkService()
    
    private init() {
        
    }
    
    func request<T: Codable>(type: T.Type,
                                url: String,
                                method: HTTPMethod,
                                completion: @escaping((Result<T, ErrorTypes>)->())) {
           AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "", method: method).responseData { response in
               switch response.result {
               case .success(let data):
                   self.handleResponse(data: data) { response in
                       completion(response)
                   }
                   
               case .failure(_):
                   completion(.failure(.generalError))
               }
           }
       }
       
       fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
           
           do {
               let result = try JSONDecoder().decode(T.self, from: data)
               completion(.success(result))
               
           } catch {
               completion(.failure(.invalidData))
           }
       }
    
}
