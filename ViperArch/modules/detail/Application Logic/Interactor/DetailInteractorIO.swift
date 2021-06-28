//
//  DetailInteractorIO.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

protocol DetailInteractorInput: class {
    
    func getUserData(with user: UserDetailDM)
    func notifyListScreen()
    func favouriteButtonTap(with name: String)
    func checkIsFavourite(for name: String) -> Bool

}

protocol DetailInteractorOutput: class {
    func obtained(user: UserDetailDM)
   
}
