//
//  RequestPageView.swift
//  team1nc3
//
//  Created by Juli Yanti on 20/07/23.
//

import SwiftUI

struct RequestPageView: View {
    let dummyUser = MRTUser.getDummyData()
    
    @State var selected: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Image(systemName: "sun.min.fill").resizable().scaledToFit().frame(width: 100, height: 100)
                }
                Spacer()
                VStack (spacing: 0){
                    MenuSection(sectionHeaderTitle: "Full Name") {
                        Text("Monica Christanta").font(.body)
                        Divider()
                    }
                    
                    MenuSection(sectionHeaderTitle: "Phone Number") {
                        Text("+628555551715").font(.body)
                        Divider()
                    }
                    
                    
                    MenuSection(sectionHeaderTitle: "Trip") {
                        // Dropdown Trip from all today's ticket
                        DropDownView()
                        Divider()
                    }
                    
                    
                    MenuSection(sectionHeaderTitle: "Estimated Time of Arrival") {
                        // Dropdown ETA from column ETA
                        DropDownView()
                        Divider()
                    }
                    
                    MenuSection(sectionHeaderTitle: "Types of help needed") {
                        // assistive tool
                        DropDownView()
                    }
                    
                    
                }
                Spacer()
                
                // Radio Check Button
                
                HStack {
                    Button {
                        self.selected.toggle()
                    } label: {
                        Image(systemName: selected ? "largecircle.fill.circle" : "circle").resizable()
                            .foregroundColor(selected ? .Semantic.Success.main : .Neutral.s80).frame(width: 12, height: 12)
                    }
                    VStack {
                        Text("Hereby, I am consent to share my location while using the app for tracking assistance purposes").font(.footnote)
                    }
                    
                    Spacer()
                }.padding(.horizontal, 20).padding(.bottom, 10)
                
                
                Button {
                    // code
                } label: {
                    Text("Request").foregroundColor(selected ? .white : .gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selected ? .blue : .Neutral.s30)
                        .cornerRadius(25)
                }.padding(.horizontal)
                
            }.navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Request").font(.headline)
                    }
                }
            }
        }
        
    }
}

struct RequestPageView_Previews: PreviewProvider {
    static var previews: some View {
        RequestPageView()
    }
}
