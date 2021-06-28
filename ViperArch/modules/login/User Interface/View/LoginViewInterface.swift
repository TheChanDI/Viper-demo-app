//
//  LoginViewInterface.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

protocol LoginViewInterface: class {
    func getUserList(data: [NameModel])
    func notifyView()
    func gotError(of error: String)
   
}
