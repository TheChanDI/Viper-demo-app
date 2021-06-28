//
//  HomeEntity.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var username: String
    var name: String
    var email: String
    var address: AddressDM
    var phone: String
    var website: String
    var company: CompanyDM
    
}

struct AddressDM: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: LocationDM
}

struct LocationDM: Codable {
    var lat: String
    var lng: String
}


struct CompanyDM: Codable {
    var name: String
    var catchPhrase: String
}
