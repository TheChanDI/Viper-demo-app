//
//  LoginServiceType.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

protocol LoginServiceType: class {
    func callUserApi(completion: @escaping (Result<[User], Error>) -> Void)
}
