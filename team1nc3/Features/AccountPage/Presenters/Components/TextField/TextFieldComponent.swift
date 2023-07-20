//
//  TextField.swift
//  team1nc3
//
//  Created by Joshua on 18/07/23.
//

import SwiftUI

struct TextFieldComponent: View {
    var fieldHeader: String = "Default"
    @State private var fieldEntry: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(fieldHeader)
                .font(.system(size: 15))
                .foregroundColor(Color.Neutral.s80)
            TextField(
                "Enter here",
                text: $fieldEntry
            )
            .font(.system(size: 15))
            .fontWeight(.semibold)
            Divider()
                .padding(0)
        }
        .padding(0)
        .padding(.horizontal, 16)
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponent()
    }
}
