//
//  LoginWireframe.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

class LoginWireframe {
     weak var view: UIViewController!
    
     lazy var detailWireframe = {
       return DetailWireframe()
     }()
    
    lazy var favouriteWireframe = {
        return FavouritesWireframe()
    }()
}

extension LoginWireframe: LoginWireframeInput {

    
    func goToDetail(user: UserDetailDM, allData: [UserDetailDM]) {
        detailWireframe.setData(user: user, allUserData: allData)
        view.navigationController?.pushViewController(detailWireframe.getMainView(), animated: true)
       
    }
    
    var storyboardName: String {return "Login"}
    
    func getMainView() -> UIViewController {
        let service = LoginService()
        let interactor = LoginInteractor(service: service)
        let presenter = LoginPresenter()
        let viewController = viewControllerFromStoryboard(of: LoginViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func navigateToFavouriteView() {
        
        view.navigationController?.pushViewController(favouriteWireframe.getMainView(), animated: true)
    }
    
    
}
