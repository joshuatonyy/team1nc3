//
//  DropDownView.swift
//  team1nc3
//
//  Created by Juli Yanti on 21/07/23.
//

import SwiftUI

struct DropDownView: View {
    @State private var selectedOption = 0
        let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

        var body: some View {
            
                Menu {
                    ForEach(Array(options.indices), id: \.self) { index in
                        Button(action: {
                            selectedOption = index
                        }) {
                            Label(options[index], systemImage: selectedOption == index ? "checkmark" : "")
                        }
                    }
                } label: {
                    HStack{
                        Text(options[selectedOption]).font(.callout).foregroundColor(.Neutral.s100)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 16,height: 8)
                    }
                }
        }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}
