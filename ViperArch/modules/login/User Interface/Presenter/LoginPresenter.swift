//
//  LoginPresenter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

class LoginPresenter {
    
	// MARK: Properties
    
    weak var view: LoginViewInterface?
    var interactor: LoginInteractorInput?
    var wireframe: LoginWireframeInput?
    var allUserData = [User]()
    
    
    
    // MARK: Converting entities
    
    func convertDataForDetail(indexPath: IndexPath) {
        let data = allUserData[indexPath.row]
        let forDetailData = UserDetailDM(name: data.name, email: data.email, phone: data.phone, website: data.website, address: data.address, company: data.company)
        
        //data conversion for map view
        let dataForMap: [UserDetailDM] = allUserData.map({
            return UserDetailDM(name: $0.name , email: $0.email, phone: $0.phone, website: $0.website, address: $0.address, company: $0.company)
        })
        
        
        wireframe?.goToDetail(user: forDetailData, allData: dataForMap)
    }
        
}

 // MARK: Login module interface

extension LoginPresenter: LoginModuleInterface {
    
    func goToDetail(indexPath: IndexPath) {
        convertDataForDetail(indexPath: indexPath)
    }
    
    func getUserList() {
        interactor?.getUser()
    }
    
    func navigateToFavouriteView() {
        wireframe?.navigateToFavouriteView()
    }
  
    
}

// MARK: Login interactor output interface

extension LoginPresenter: LoginInteractorOutput {
    
    func obtained(result: Result<[NameModel], Error>, allData: [User]?) {
        
        switch result {
        
        case .success(let users):
            view?.getUserList(data: users)
            if let data = allData {
                allUserData = data
            }
            
          
        case .failure(let error):
            view?.gotError(of: error.localizedDescription)
            print(error.localizedDescription)
        }
    
    }
    
    
    func notifyTheMainView() {
        print("I got the notification here")
        view?.notifyView()
    }
    
}
