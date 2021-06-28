//
//  DetailWireframe.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

class DetailWireframe {
     weak var view: UIViewController!
     var user: UserDetailDM?
     var allUserData = [UserDetailDM]()
    lazy var mapWireFrame = {
        return MapWireframe()
    }()
}

extension DetailWireframe: DetailWireframeInput {

    func setData(user: UserDetailDM, allUserData: [UserDetailDM]) {
        self.user = user
        self.allUserData = allUserData
    }
    
    func navigateToMap() {
        if let data = user {
            mapWireFrame.getUserLocationData(data: data, allUserData: allUserData)
        }
        view.presentFullScreen(mapWireFrame.getMainView(), animated: true)
       
    }
    
    var storyboardName: String {return "Detail"}
    
    func getMainView() -> UIViewController {
        let service = DetailService()
        let interactor = DetailInteractor(service: service)
        let presenter = DetailPresenter()
        let viewController = viewControllerFromStoryboard(of: DetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        
        
        if let user = user {
            interactor.getUserData(with: user)
        }
        return viewController
    }


    

    
}
