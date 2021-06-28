//
//  WireframeInput.swift
//  BigMart
//
//  Created by Rojan Shrestha on 5/25/19.
//  Copyright © 2019 Ekbana. All rights reserved.
//

import UIKit

protocol WireframeInput {
    var window: UIWindow? {get}
    var view: UIViewController! {get}
    var storyboardName: String {get}
    func openMainView(source: UIViewController)
    func pushMainView(in source: UINavigationController)
    func getMainView() -> UIViewController
    func openMainViewIn(window: UIWindow)
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController)
}

extension WireframeInput {
    
    var window: UIWindow? {
        return (UIApplication.shared.delegate as! SceneDelegate).window
    }
    
    func viewControllerFromStoryboard<T: UIViewController>(of type: T.Type) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    func openMainViewIn(window: UIWindow) {
        let view = self.getMainView()
        window.rootViewController = view
    }
    
    func openMainView(source: UIViewController) {
        let mainView = self.getMainView()
        source.presentFullScreen(mainView, animated: true, completion: nil)
    }
    
    func pushMainView(in source: UINavigationController) {
        let mainView = self.getMainView()
        source.pushViewController(mainView, animated: true)
    }
    
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        source.presentFullScreen(nav, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    
    func presentFullScreen(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            viewController.modalPresentationStyle = .fullScreen
        }
        self.present(viewController, animated: animated, completion: completion)
    }
    
}
