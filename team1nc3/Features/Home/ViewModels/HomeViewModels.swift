//
//  HomeViewModels.swift
//  team1nc3
//
//  Created by Rizki Samudra on 20/07/23.
//

import Foundation

import SwiftUI

class HomeViewModels: ObservableObject, Identifiable {
    
    var lifeStyleData: [String] {
        var lifeStyleList = [] as [String]
        lifeStyleList.append("ic_lifestyle_jejakin")
        lifeStyleList.append("ic_lifestyle_pasarpolis")
        lifeStyleList.append("ic_lifestyle_rekosistem")
        lifeStyleList.append("ic_lifestyle_blu")
        lifeStyleList.append("ic_lifestyle_mrtj")
        lifeStyleList.append("ic_lifestyle_cakap")
        return lifeStyleList
    }
    
    
    var firstMenu: [MenuModel] {
        return MenuModel().sampleListDataTop()
    }
    
    var secondMenu: [MenuModel] {
        return MenuModel().sampleListDataBot()
    }
    
    
}
