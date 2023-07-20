//
//  Feature1ViewModel.swift
//  team1nc3
//
//  Created by Joshua on 17/07/23.
//

import SwiftUI

class Feature1ViewModel: ObservableObject, Identifiable {
    var feature1List = Feature1RepositorySample()
    
    var feature1: [Feature1Model] {
        var feature1a = [] as [Feature1Model]
        for feature1 in feature1List.feature1Data {
            feature1a.append(feature1)
        }
        
        return feature1a
    }
}
