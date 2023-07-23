//
//  Users.swift
//  CatAPIProject
//
//  Created by Rizki Samudra on 22/07/23.
//

import Foundation

struct MRTSpecialUser: Codable {
    var name: String
    var email: String
    var phone: String
    var dob: String
    var gender: String
    var id_card_number: String
    var disability: String
}

extension MRTSpecialUser {
    static func getDummyData() -> MRTSpecialUser {
        return MRTSpecialUser(
            name: "Wiwin Santoso",
            email: "wiwin.santoso@example.com",
            phone: "08123456888",
            dob: "20-09-1990",
            gender: "female",
            id_card_number: "KTP16675",
            disability: "Mobility Wheelchair"
        )
    }
}
