//
//  MapWireframe.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

import UIKit

class MapWireframe {
     weak var view: UIViewController!
     var userLocationData: UserDetailDM?
     var allUserData = [UserDetailDM]()
}

extension MapWireframe: MapWireframeInput {
    
    var storyboardName: String {return "Map"}
    
    func getMainView() -> UIViewController {
        let service = MapService()
        let interactor = MapInteractor(service: service)
        let presenter = MapPresenter()
        let viewController = viewControllerFromStoryboard(of: MapViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        
        if let data = userLocationData {
            interactor.getUserLocationData(data: data, allData: allUserData)
        }

        return viewController
    }
    
    func dismissView() {
        view.dismiss(animated: true, completion: nil)
    }
    
    func getUserLocationData(data: UserDetailDM, allUserData: [UserDetailDM]) {
        self.userLocationData = data
        self.allUserData = allUserData
    }
}
