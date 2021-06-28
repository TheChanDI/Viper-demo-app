//
//  HomeInteractor.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import Foundation


protocol HomeInteractor {
    var presenter: HomePresenter? {get set}
    
    func getUsers()
    
}

class UserInteractor: HomeInteractor {
    var presenter: HomePresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data , error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error!))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(responseData))
                
            }
            catch(let error) {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
        
    }
    
    
}
