//
//  Feature1Component1View.swift
//  team1nc3
//
//  Created by Joshua on 17/07/23.
//

import SwiftUI

struct Feature1Component1View: View {
    
    @StateObject private var feature1ViewModel = Feature1ViewModel()
    var body: some View {
        VStack{
            ForEach(0..<feature1ViewModel.feature1.count) { idx in
                Text("\(feature1ViewModel.feature1[idx].a + feature1ViewModel.feature1[idx].b)")
                    .foregroundColor(.black)
            }
        }
    }
}

struct Feature1Component1View_Previews: PreviewProvider {
    static var previews: some View {
        Feature1Component1View()
    }
}
