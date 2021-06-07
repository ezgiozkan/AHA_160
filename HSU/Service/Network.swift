//
//  Network.swift
//  HSU
//
//  Created by Batuhan Baran on 28.04.2021.
//

import Foundation
import JWTDecode

protocol PetsCollectionViewModelDelegateOutput: class {
    func responseViewModel(viewModel: PetsCollectionViewModel)
}

class Network {
    
    static let shared = Network()
   
    var baseUrl: String
    var endPoint: String
    
    weak var delegate: PetsCollectionViewModelDelegateOutput?
    
    init() {
        self.baseUrl = "http://api.hayvansaglikuygulamasi.com/api"
        self.endPoint = ""
    }
 
    func signUp(fullName: String, phoneNumber: String, email: String, password: String, completion: @escaping (Int?,String?) -> ()) {
        
        self.endPoint = "/users/register"
        
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
                
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    completion(httpResponse.statusCode,nil)
                }
                
            }.resume()
            
        }catch {
            
            completion(nil,error.localizedDescription)
        }

    }
    
    func signIn(email: String, password: String, completion: @escaping (Int?,String?) -> ()) {
        
        self.endPoint = "/users/login"
        
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
                        
                        do {
                            
                            let jwt = try decode(jwt: token ?? "")
                            
                            let emailClaim = jwt.claim(name: "email")
                            
                            if let email = emailClaim.string {
                                
                                UserDefaults.standard.setValue(email, forKey: "currentUserEmail")

                            }
                            
                            let idClaim = jwt.claim(name: "nameid")
                            
                            if let nameid = idClaim.string {
                                
                                UserDefaults.standard.setValue(nameid, forKey: "currentUserId")
                            }
                       
                        }catch {
                            
                            print("tokenError")
                        }
                        
                        
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
    
    func addPet(params: [String: Any],completion: @escaping (Int?,PetResponse?) -> ()) {
        
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

                        guard let data = data else { return }
                        
                        let decoder = JSONDecoder()
                        
                        do {
                            
                            let jsonData = try decoder.decode(PetResponse.self, from: data)
                            completion(httpResponse.statusCode,jsonData)
                        
                        }catch{
                            
                            completion(Int(error.localizedDescription),nil)
                            
                        }
                        
                    }
                    
                    else if httpResponse.statusCode == 401 {
                        print("fail")
                        completion(httpResponse.statusCode,nil)
                    }
                    
                    else {
                        
                        completion(httpResponse.statusCode,nil)
                    }
                    
                }
                
            }.resume()
            
        }catch {
            
            completion(Int(error.localizedDescription),nil)
        }
    }
    
    func getPet(userId: Int, completion: @escaping (Result<[Pets],Error>) -> ()) {
        
        self.endPoint = "/users/animals/?userId=\(userId)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            do {
                
                let jsonData = try decoder.decode([Pets].self, from: data!)
                //self.delegate?.responseViewModel(viewModel: viewModel)
                
                completion(.success(jsonData))
            
            }catch{
                
                completion(.failure(error))
                
            }
        }.resume()
        
    }

    func getHealthInformation(currentPetId: Int, completion: @escaping (Result<[HealthInformation],Error>) -> ()) {
        
        self.endPoint = "/animals/healthInformations/?animalId=\(currentPetId)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            do {
                
                let jsonData = try decoder.decode([HealthInformation].self, from: data!)
                
                completion(.success(jsonData))
            
            }catch{
                
                completion(.failure(error))
                
            }
        }.resume()
    }
    
    func deletePet(animalId: Int,completion: @escaping (Int?,Error?) -> ()) {
        
        self.endPoint = "/animals/delete/?animalId=\(animalId)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        do {
             
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    if httpResponse.statusCode == 200 {
                        
                     completion(httpResponse.statusCode,nil)
                                          
                    }
                    else {
                                 
                        completion(nil,error)
                    }
                }
                
            }.resume()
            
        }
    }
    
    func getUserInfo(completion: @escaping (Result<User,Error>) -> ()) {
        
        let userId = UserDefaults.standard.integer(forKey: "currentUserId")
        
        self.endPoint = "/users/detail/?userId=\(userId)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            do {
                
                let jsonData = try decoder.decode(User.self, from: data!)
                
                completion(.success(jsonData))
            
            }catch{
                
                completion(.failure(error))
                
            }
        }.resume()
        
    }
    
    func updateUserInfo(params: [String:Any], completion: @escaping (Int?,Error?) -> ()) {
        
        let userId = UserDefaults.standard.integer(forKey: "currentUserId")
        
        self.endPoint = "/users/update/?userId=\(userId)"
        
        guard let url = URL(string: self.baseUrl + self.endPoint) else { return }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let params = params

        let data = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        
        URLSession.shared.uploadTask(with: request, from: data) { (responseData, response, error) in
            if let error = error {
                print("Error making PUT request: \(error.localizedDescription)")
                return
            }
            
            if let responseCode = (response as? HTTPURLResponse)?.statusCode, let responseData = responseData {
                guard responseCode == 200 else {
                    print("Invalid response code: \(responseCode)")
                    return
                }
                
                if let responseJSONData = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                    completion(200,error)
                }
            }
        }.resume()
    }
    
}
