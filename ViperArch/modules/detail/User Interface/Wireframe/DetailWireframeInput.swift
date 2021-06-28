//
//  DetailWireframeInput.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

protocol DetailWireframeInput: WireframeInput {
    func setData(user: UserDetailDM, allUserData: [UserDetailDM])
    func navigateToMap()

}
