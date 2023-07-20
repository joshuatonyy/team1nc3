//
//  AccountPageViews.swift
//  team1nc3
//
//  Created by Joshua on 17/07/23.
//

import SwiftUI

struct AccountPageViews: View {
    @State private var isClicked: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack{
                    VStack(alignment: .leading, spacing: 16){
                        VStack {
                            Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                            Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            )
                            .cornerRadius(100)
                            .frame(maxWidth: .infinity)
                            
                            // Caption1/Emphasized
                            Text("Edit Picture")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        }
                        
                        Group{
                            TextFieldComponent(fieldHeader: "Name")
                            TextFieldComponent(fieldHeader: "Phone Number")
                            TextFieldComponent(fieldHeader: "Email")
                        }
                        TextFieldComponent(fieldHeader: "Date of Birth")
                        DropdownGender()
                        TextFieldComponent(fieldHeader: "Identity Card Number")
                        TextFieldComponent(fieldHeader: "Identity Card")
                        TextWithButton(fieldHeader: "Disability (optional)")
                        DropdownDisability()
                        
                        
                        VStack(spacing: 24) {
                            HStack(alignment: .center, spacing: 8) {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 12, height: 12)
                                  .cornerRadius(8)
                                  .overlay( isClicked == false ?
                                    RoundedRectangle(cornerRadius: 8)
                                      .inset(by: 0.25)
                                      .stroke(Color(red: 0.38, green: 0.38, blue: 0.38), lineWidth: 0.5) :
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 2)
                                        .stroke(Color(red: 0.1, green: 0.76, blue: 0.44), lineWidth: 4)
                                  )
                                  .onTapGesture {
                                      isClicked.toggle()
                                  }
                                
                                Text("Hereby, I am consent to share my location while using the app for tracking assistance purposes")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color.Neutral.s80)
                            }
                            .padding(0)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(alignment: .center, spacing: 4) {
                                Text("Save")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color.Neutral.s10)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 357, alignment: .center)
                                    .background(isClicked == true ? Color(red: 0, green: 0.48, blue: 1) : Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                                .cornerRadius(12)
                            }
                        }
                    }
                }
            .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountPageViews_Previews: PreviewProvider {
    static var previews: some View {
        AccountPageViews()
    }
}
