//
//  FavouritesWireframe.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//
//

import UIKit

class FavouritesWireframe {
     weak var view: UIViewController!
}

extension FavouritesWireframe: FavouritesWireframeInput {
    
    var storyboardName: String {return "Favourites"}
    
    func getMainView() -> UIViewController {
        let service = FavouritesService()
        let interactor = FavouritesInteractor(service: service)
        let presenter = FavouritesPresenter()
        let viewController = viewControllerFromStoryboard(of: FavouritesViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
 
}
