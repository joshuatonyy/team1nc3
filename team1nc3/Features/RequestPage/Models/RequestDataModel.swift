//
//  RequestDataModel.swift
//  team1nc3
//
//  Created by Juli Yanti on 20/07/23.
//

//struct Card {
//    let title: String
//    let content: String
//    var isExpanded: Bool = false
//}
//
//struct Section {
//    let title: String
//    var cards: [Card]
//}

struct MRTUser {
    let name: String
    let email: String
    let phone: String
    let dob: String
    let gender: String
    let id_card_number: String
    let disability_type: String
}


extension MRTUser {
    static func getDummyData() -> MRTUser {
        return MRTUser(
            name: "John Doe",
            email: "john.doe@example.com",
            phone: "+1 123-456-7890",
            dob: "1990-01-01",
            gender: "Male",
            id_card_number: "ABC123XYZ",
            disability_type: "Mobility Wheelchair"
        )
    }
}
