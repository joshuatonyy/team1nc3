//
//  Feature1RepositorySample.swift
//  team1nc3
//
//  Created by Joshua on 17/07/23.
//

import Foundation

class Feature1RepositorySample{
    var feature1Data: [Feature1Model] = []
    
    init() {
        let T1 = Feature1Model(a: 1, b: 2)
        let T2 = Feature1Model(a: 3, b: 5)
        
        feature1Data.append(T1)
        feature1Data.append(T2)
    }
}
