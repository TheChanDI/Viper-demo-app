//
//  LoginInteractor.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

class LoginInteractor {
    
	// MARK: Properties
    
    weak var output: LoginInteractorOutput?
    private let service: LoginServiceType
    var user = [User]()
    // MARK: Initialization
    
    init(service: LoginServiceType) {
        self.service = service
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification), name: .init(rawValue: "notifyView"), object: nil)
    }
    
    @objc func getNotification() {
     
        output?.notifyTheMainView()
    }

    // MARK: Converting entities
    
    func convertData(user: [User]) {
        let data: [NameModel] = user.map({ item in
            return NameModel(name: item.username, fullName: item.name)
        })
        
        output?.obtained(result: .success(data), allData: user)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: Login interactor input interface

extension LoginInteractor: LoginInteractorInput {
    
    func getUser() {
        service.callUserApi {[weak self] (result) in
            switch result {
                
            case .success(let user):
                self?.convertData(user: user)
//                self?.output?.obtained(result: .success(user))
            case .failure(let error):
                self?.output?.obtained(result: .failure(error), allData: nil)
            }
        }
    }
    

    
}
