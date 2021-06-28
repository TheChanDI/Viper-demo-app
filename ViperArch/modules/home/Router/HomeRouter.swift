//
//  HomeRouter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import UIKit

//App entry point
typealias EntryPoint = HomeView & UIViewController

protocol HomeRouter {
    var entry: EntryPoint? {get}
    static func start() -> HomeRouter

}

class UserRouter: HomeRouter {
    

    var entry: EntryPoint?
    
    static func start() -> HomeRouter {
        let router = UserRouter()
        
        let homeView: HomeView = HomeVC()
        var presenter: HomePresenter = UserPresenter()
        var interactor: HomeInteractor = UserInteractor()
        
        homeView.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = homeView
        presenter.interactor = interactor
        
        router.entry = homeView as? EntryPoint
        
        return router
        
    }
    
    
    
    
}
