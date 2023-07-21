//
//  ProfileRepositorySample.swift
//  team1nc3
//
//  Created by Rizki Samudra on 18/07/23.
//

import Foundation

class ProfileRepositorySample{
    var profileDataModel: ProfileModel
    
    init() {
        profileDataModel = ProfileModel(fullName: "Monica Christanta", phoneNumber: "+93921832173", departureStation: "Lebak Bulus", arrivalStation: "Dukuh Atas", eta: "12.00", typesOfHelp: "Wheelchair")
    }
}
