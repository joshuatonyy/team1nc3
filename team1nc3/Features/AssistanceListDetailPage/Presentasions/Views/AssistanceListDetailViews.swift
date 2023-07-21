//
//  AssistanceListDetailViews.swift
//  team1nc3
//
//  Created by Rizki Samudra on 18/07/23.
//

import Foundation
import SwiftUI

//Note Before you use this view

// Please Define this 2 var, bottomSheet for showing bottomSheet, detentHeight for actual height of bottomSheet View
//@State private var bottomSheet: Bool = false
//@State var detentHeight: CGFloat = 0

// Put this code to show this view

//    .sheet(isPresented: $bottomSheet){
//        AssistanceListDetailViews()
//            .readHeight()
//            .onPreferenceChange(HeightPreferenceKey.self) { height in
//                if let height {
//                    self.detentHeight = height
//                }
//            }
//            .presentationDetents([.height(self.detentHeight)])
//    }


struct AssistanceListDetailViews: View {
    
    @Environment(\.dismiss) var dismiss
    var isDisabled: Bool = false
    @StateObject private var assitanceListDetailViewModel = AssitanceListDetailViewModel()
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Image("ic_resize_indicator")
                        .frame(width: 36)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .greatestFiniteMagnitude)
                //TOP View
                HStack {
                    VStack(alignment: .leading) {
                        Text("Time Requested")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(Color("neutral-80"))
                        
                        Text(assitanceListDetailViewModel.todayDate ?? "")
                            .foregroundColor(Color("neutral-80"))
                        
                    }
                    Spacer()
                    
                    Button (action: {
                        dismiss()
                    }, label: {
                        Image("ic_close")
                        
                    })
                }.padding(.top, 16)
                
                Divider()
                    .padding(.vertical, 16)
                
                
                //Content View
                VStack(alignment: .leading) {
                    Text("Details")
                        .font(.system(size: 20,weight: .bold))                                    .foregroundColor(Color("neutral-80"))
                    
                    
                    Group() {
                        
                        Text("FullName")
                            .font(.subheadline)
                            .foregroundColor(Color("neutral-80"))
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.fullName ?? "")
                            .foregroundColor(Color("neutral-80"))
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text("Phone Number")
                            .foregroundColor(Color("neutral-80"))
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.phoneNumber ?? "")
                            .foregroundColor(Color("neutral-80"))
                        
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text("Departure Station")
                            .foregroundColor(Color("neutral-80"))
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.departureStation  ?? "")
                            .foregroundColor(Color("neutral-80"))
                            .font(.body)
                            .fontWeight(.semibold)
                        
                    }
                    
                    Group() {
                        
                        Text("Arrival Station")
                            .foregroundColor(Color("neutral-80"))
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.arrivalStation ?? "")
                            .foregroundColor(Color("neutral-80"))
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text("Estimated Time of Arrival")
                            .foregroundColor(Color("neutral-80"))
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.eta ?? "")
                            .foregroundColor(Color("neutral-80"))
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text("Types of help needed")                                    .foregroundColor(Color("neutral-80"))
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.top, 8)
                        
                        Text(assitanceListDetailViewModel.profileSample?.typesOfHelp ?? "")
                            .foregroundColor(Color("neutral-80"))
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    
                    
                }
                
                Button (action: {
                    //TODO: DO SOMETHING MAGIC
                    if !isDisabled{
                        print("do Some Magic")
                        dismiss()
                    }
                }, label: {
                    if isDisabled {
                        Text("Cancel Request")
                            .padding(.vertical, 16)
                            .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: 50)
                            .font(.system(size: 17,weight: .medium))
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(12)

                    }else{
                        Text("Cancel Request")
                            .padding(.vertical, 16)
                            .frame(maxWidth: .greatestFiniteMagnitude,maxHeight: 50)
                            .font(.system(size: 17,weight: .medium))
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(12)

                    }
                })
                .padding(.top, 16)

                
            }
            .frame(maxWidth:.greatestFiniteMagnitude)
            .padding(.horizontal, 16)
            
        }
        .cornerRadius(8, corners: [.topLeft,.topRight])

        
        .onAppear {
            assitanceListDetailViewModel.getProfile()
            assitanceListDetailViewModel.getTodayDate()
        }
        
        
    }
}


struct AssistanceListDetailViews_Previews: PreviewProvider {
    static var previews: some View {
        AssistanceListDetailViews()
    }
}
