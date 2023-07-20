//
//  DropdownGender.swift
//  team1nc3
//
//  Created by Joshua on 19/07/23.
//

import SwiftUI

struct DropdownGender: View {
    var fieldHeader: String = "Gender"
    @State var choiceMade: Int = 0
    @State var gender = ["Male", "Female", "Other"]
    var body: some View {
        VStack (alignment: .leading){
            Text(fieldHeader)
                .font(.system(size: 15))
            Menu{
                Button(action: {
                    choiceMade = 2
                }, label: {
                    Text("Other")
                })
                Button(action: {
                    choiceMade = 1
                }, label: {
                    Text("Female")
                })
                Button(action: {
                    choiceMade = 0
                }, label: {
                    Text("Male")
                })
            } label: {
                Label(
                    title: {
                        Text("\(gender[choiceMade])")
                            .font(.system(size: 12))
                            .foregroundColor(Color.Neutral.s100)
                    },
                    icon: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12))
                            .foregroundColor(Color.Neutral.s100)
                    }
                )
            }
            .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32, alignment: .leading)
            .background(.white)
            .cornerRadius(4)
            .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88).opacity(0.05), radius: 2, x: 0, y: 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

struct DropdownGender_Previews: PreviewProvider {
    static var previews: some View {
        DropdownGender()
    }
}
