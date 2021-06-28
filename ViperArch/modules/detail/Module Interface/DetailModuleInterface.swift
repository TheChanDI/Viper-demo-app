//
//  DetailModuleInterface.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

protocol DetailModuleInterface: class {
    func notifyScreen()
    func navigateToMap()
    func favouriteButtonTap(with name: String)
    func checkIsFavourite(for name: String) -> Bool
}
