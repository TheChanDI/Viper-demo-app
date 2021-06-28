//
//  LoginModuleInterface.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

protocol LoginModuleInterface: class {
    func getUserList()
    func goToDetail(indexPath: IndexPath)
    func navigateToFavouriteView()
}
