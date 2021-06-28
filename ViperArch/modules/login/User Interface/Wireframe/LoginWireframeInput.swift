//
//  LoginWireframeInput.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

protocol LoginWireframeInput: WireframeInput {
    func goToDetail(user: UserDetailDM, allData: [UserDetailDM])
    func navigateToFavouriteView()
}
