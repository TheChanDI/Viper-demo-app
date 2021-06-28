//
//  LoginInteractorIO.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

protocol LoginInteractorInput: class {
    func getUser()
 
}

protocol LoginInteractorOutput: class {
    func obtained(result: Result<[NameModel], Error>, allData: [User]?)
    func notifyTheMainView()
}
