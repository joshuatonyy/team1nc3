//
//  PointView.swift
//  team1nc3
//
//  Created by Rizki Samudra on 21/07/23.
//

import Foundation

import SwiftUI

struct PointView: View {

    var body: some View {
        
        HStack {
            Text("You have 0 pts")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.white)
            Image(systemName: "creditcard.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 16,height: 16)
        }
        .padding(.vertical,8)
        .padding(.horizontal,12)
        .background(.green)
        .cornerRadius(16)
        
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
