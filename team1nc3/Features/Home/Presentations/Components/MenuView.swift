//
//  MenuView.swift
//  team1nc3
//
//  Created by Rizki Samudra on 20/07/23.
//

import Foundation
import SwiftUI

struct MenuView: View {
    
    var menu: MenuModel? = nil
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "\(menu?.image ?? "")" )
                .font(Font.system(.title3))
                .fontWeight(.regular)
                .foregroundColor(Color.Neutral.s80)
                .padding(.top,4)
            
            Text(menu?.name ?? "")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.Neutral.s100)
        }
      
        .padding(8)
        .frame(maxWidth: 74,maxHeight: 58)
        .background(.white)
        .cornerRadius(8)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu: MenuModel(image: "ticket", name: "Ticket")
        )
    }
}
