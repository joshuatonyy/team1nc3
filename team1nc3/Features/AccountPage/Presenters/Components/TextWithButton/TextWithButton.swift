//
//  TextWithButton.swift
//  team1nc3
//
//  Created by Joshua on 18/07/23.
//

import SwiftUI

struct TextWithButton: View {
    var fieldHeader: String = "Identity Card (Optional)"
    var buttonText: String = "Upload"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(fieldHeader)
                .font(.system(size: 15))
                .foregroundColor(Color.Neutral.s80)
            VStack(alignment: .leading, spacing: 4) {
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .font(.system(size: 12))
                    Text("Upload")
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .font(.system(size: 12))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .cornerRadius(4)
            .overlay(
            RoundedRectangle(cornerRadius: 4)
            .inset(by: 0.35)
            .stroke(Color(red: 0, green: 0.48, blue: 1), lineWidth: 0.7)
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(0)
        .padding(.horizontal, 16)
    }
}

struct TextWithButton_Previews: PreviewProvider {
    static var previews: some View {
        TextWithButton()
    }
}
