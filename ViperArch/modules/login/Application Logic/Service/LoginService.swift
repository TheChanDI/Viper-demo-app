//
//  LoginService.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

class LoginService: LoginServiceType {
    
 
    
    // MARK: Properties
    
    // MARK: Initialization
    
    func callUserApi(completion: @escaping (Result<[User], Error>) -> Void) {
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
          let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
      
              guard let data = data , error == nil else {
                completion(.failure(error!))
                  return
              }
  
              do {
                  let responseData = try JSONDecoder().decode([User].self, from: data)
  
                    completion(.success(responseData))
              }
              catch(let error) {
                completion(.failure(error))
              }
          }
          task.resume()
    }
    
    // MARK: Data management
}
