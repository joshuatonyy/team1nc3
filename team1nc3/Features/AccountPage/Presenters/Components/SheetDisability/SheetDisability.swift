//
//  SheetDisability.swift
//  team1nc3
//
//  Created by Joshua on 20/07/23.
//

import SwiftUI

struct SheetDisability: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Text("Disability")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                .padding(.top, 24)
                .padding(.bottom, 12)
                .frame(width: 393, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 16){
                    HStack(alignment: .center, spacing: 16) {
                        // Body/Regular
                        Text("􁈑")
                          .font(Font.custom("SF Pro", size: 17))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                          .frame(width: 24, height: 24, alignment: .top)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Mobility wheelchair")
                                .font(.system(size: 17))
                                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                                .frame(width: 273, alignment: .topLeading)
                            Text("Assist individuals with mobility limitations in moving around and performing daily activities.")
                              .font(Font.custom("SF Pro", size: 13))
                              .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                              .frame(width: 273, alignment: .topLeading)
                        }
                        .padding(0)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .background(.white)
                            .cornerRadius(4)
                            .overlay(
                            RoundedRectangle(cornerRadius: 4)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.62, green: 0.62, blue: 0.62), lineWidth: 0.5)
                            )
                    }
                    .padding(0)
                    .frame(width: 357, alignment: .center)
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 4) {
                    Text("Confirm")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .frame(width: 357, alignment: .center)
                .background(Color(red: 0, green: 0.48, blue: 1))
                .cornerRadius(12)
                .onTapGesture {
                    dismiss()
                }
            }
        }
        .frame(width: 390, height: 702)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.05), radius: 50, x: 0, y: 0)
    }
}

struct SheetDisability_Previews: PreviewProvider {
    static var previews: some View {
        SheetDisability()
    }
}
