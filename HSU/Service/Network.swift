//
//  Network.swift
//  HSU
//
//  Created by Batuhan Baran on 28.04.2021.
//

import Foundation

class Network {
    
    static let shared = Network()
   
    
    var baseUrl: String
    var endPoint: String
    
    init() {
        
        self.baseUrl = "http://api.hayvansaglikuygulamasi.com/api/auth"
        self.endPoint = ""
    }
    
    func signUp(fullName: String, phoneNumber: String, email: String, password: String, completion: @escaping (Int?,String?) -> ()) {
        
        self.endPoint = "/register"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = [
            
            "fullName": fullName,
            "phoneNumber": phoneNumber,
            "email": email,
            "password": password,
            
        ]
        
        do {
            
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            urlRequest.httpBody = data
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                
                guard let data = data else { return }
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    completion(httpResponse.statusCode,nil)
                }
                
            }.resume()
            
        }catch {
            
            completion(nil,error.localizedDescription)
        }

    }
    
    func signIn(email: String, password: String, completion: @escaping (Int?,String?) -> ()) {
        
        self.endPoint = "/login"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = ["email": email, "password": password]
        
        do {
            
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            urlRequest.httpBody = data
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                

                if let httpResponse = response as? HTTPURLResponse {

                    if httpResponse.statusCode == 200 {

                        guard let data = data else { return }
                        let token = String(data: data, encoding: .utf8)
                        completion(httpResponse.statusCode,token)
                    }
                    
                    else if httpResponse.statusCode == 401 {

                        completion(httpResponse.statusCode,nil)
                    }
                    
                }
                
            }.resume()
            
        }catch {
            
            completion(nil,error.localizedDescription)
        }

    }
}
