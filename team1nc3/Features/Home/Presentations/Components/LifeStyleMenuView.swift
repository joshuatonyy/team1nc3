//
//  LifeStyleMenuView.swift
//  team1nc3
//
//  Created by Rizki Samudra on 20/07/23.
//

import SwiftUI

struct LifeStyleMenuView: View {
    
    var menuImage: String = ""
    var body: some View {
        VStack {
            Image(menuImage)
                .resizable()
                .scaledToFit()
        }
    }
}

struct LifeStyleMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LifeStyleMenuView(menuImage: "ic_lifestyle_jejakin")
    }
}
