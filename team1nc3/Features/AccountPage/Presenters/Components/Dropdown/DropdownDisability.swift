//
//  DropdownDisability.swift
//  team1nc3
//
//  Created by Joshua on 20/07/23.
//

import SwiftUI

struct DropdownDisability: View {
    @State private var showingSheet = false
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text("Disability (optional)")
            .font(Font.custom("SF Pro", size: 15))
            .foregroundColor(Color.Neutral.s80)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal, 16)
            
            HStack(alignment: .center) {
                HStack(alignment: .center, spacing: 8.4) {
                    Text("Choose")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.Neutral.s90)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 17))
                }
                .padding(0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32, alignment: .leading)
            .background(.white)
            .cornerRadius(4)
            .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88).opacity(0.05), radius: 2, x: 0, y: 4)
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topTrailing)
        .onTapGesture {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetDisability()
        }
    }
}

struct DropdownDisability_Previews: PreviewProvider {
    static var previews: some View {
        DropdownDisability()
    }
}
