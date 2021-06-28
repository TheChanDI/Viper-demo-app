//
//  MapWireframeInput.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

import Foundation

protocol MapWireframeInput: WireframeInput {
    func dismissView()
    func getUserLocationData(data: UserDetailDM, allUserData: [UserDetailDM])
}
