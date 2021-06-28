//
//  MapInteractorIO.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

protocol MapInteractorInput: class {
    func getUserLocationData(data: UserDetailDM, allData: [UserDetailDM])
}

protocol MapInteractorOutput: class {
    func getUserLocationData(data: UserDetailDM)
    func getAllUserData(data: [MapViewDM])
}
