//
//  DropDownView.swift
//  team1nc3
//
//  Created by Juli Yanti on 21/07/23.
//

import SwiftUI

struct DropDownView: View {
    @State private var selectedOption = 0
    //        let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    @Binding var dataOptions: [String]
    var completionHandler: ((Int)->Void)?
    
    var body: some View {
        
        Menu {
            ForEach(Array(dataOptions.indices), id: \.self) { index in
                Button(action: {
                    selectedOption = index
                    completionHandler?(index)
                }) {
                    Label(dataOptions[index], systemImage: selectedOption == index ? "checkmark" : "")
                }
            }
        } label: {
            HStack{
                if(dataOptions.count > 0) {
                    
                    Text(dataOptions[selectedOption]).font(.callout).foregroundColor(.Neutral.s100)
                }else {
                    Text("").font(.callout).foregroundColor(.Neutral.s100)
            
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 16,height: 8)
            }
        }
        .onAppear{
            print("dataOptions: \(dataOptions)")
        }
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView(dataOptions: .constant([]), completionHandler: {i in
            print(i)
        })
    }
}
