//
//  MenuModel.swift
//  team1nc3
//
//  Created by Rizki Samudra on 20/07/23.
//

import Foundation

struct MenuModel : Codable , Hashable{
    var image: String? = ""
    var name: String? = ""
    var isSquare: Bool = false
    
    func sampleListDataTop() -> [MenuModel] {
        var menuTop = [] as [MenuModel]
        menuTop.append(MenuModel(image: "ticket", name: "Ticket"))
        menuTop.append(MenuModel(image: "calendar", name: "Schedule",isSquare: true))
        menuTop.append(MenuModel(image: "creditcard", name: "My Card"))
        menuTop.append(MenuModel(image: "tram.circle", name: "Station",isSquare: true))
        return menuTop
    }
    
    func sampleListDataBot() -> [MenuModel] {
        var menuTop = [] as [MenuModel]
        menuTop.append(MenuModel(image: "person.2", name: "Assitance"))
        menuTop.append(MenuModel(image: "creditcard.circle", name: "Points",isSquare: true))
        menuTop.append(MenuModel(image: "newspaper", name: "News",isSquare: true))
        menuTop.append(MenuModel(image: "rectangle.grid.2x2", name: "More",isSquare: true))
        return menuTop
    }
    
}
