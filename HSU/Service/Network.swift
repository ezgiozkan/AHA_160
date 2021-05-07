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
        
        self.baseUrl = "http://api.hayvansaglikuygulamasi.com/api"
        self.endPoint = ""
    }
    
    func signUp(fullName: String, phoneNumber: String, email: String, password: String, completion: @escaping (Int?,String?) -> ()) {
        
        self.endPoint = "/auth/register"
        
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
        
        self.endPoint = "/auth/login"
        
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
    
    func addPet(params: [String: Any],completion: @escaping (Int?) -> ()) {
        
        print(params)
        self.endPoint = "/animals/add"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = params
        
        do {
            
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            urlRequest.httpBody = data
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                

                if let httpResponse = response as? HTTPURLResponse {

                    if httpResponse.statusCode == 200 {

                        completion(httpResponse.statusCode)
                    }
                    
                    else if httpResponse.statusCode == 401 {

                        completion(httpResponse.statusCode)
                    }
                    
                }
                
            }.resume()
            
        }catch {
            
            completion(Int(error.localizedDescription))
        }
    }
    
    func getPet(id: Int, completion: @escaping (Result<[Pets],Error>) -> ()) {
        
        self.endPoint = "/animals/detail/?id=\(id)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            do {
                
                let jsonData = try decoder.decode([Pets].self, from: data!)
                completion(.success(jsonData))
            
            }catch{
                
                completion(.failure(error))
                
            }
        }.resume()
        
    }
}
