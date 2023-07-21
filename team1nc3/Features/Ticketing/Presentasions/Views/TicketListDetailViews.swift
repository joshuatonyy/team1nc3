//
//  TicketListDetailViews.swift
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
//        TicketListDetailViews()
//            .readHeight()
//            .onPreferenceChange(HeightPreferenceKey.self) { height in
//                if let height {
//                    self.detentHeight = height
//                }
//            }
//            .presentationDetents([.height(self.detentHeight)])
//    }
struct TicketListDetailViews: View {
    
    @Environment(\.dismiss) var dismiss
    var isDisabled: Bool = false
    @StateObject private var ticketListDetailViewModel = TicketDetailViewModel()
    @State private var selectedSegment = 0
    
    @State private var selectedDepartureStationIndex = 0
    @State private var selectedArrivalStationIndex = 0
    @State private var needsWheelchairAssistance = false
    @State private var selectedTime = Date()


    let stations = ["Select a Station", "Lebak Bulus Grab", "Fatmawati Indomaret", "Cipete Raya", "Haji Nawi", "Blok A", "Blok M BCA", "ASEAN", "Senayan", "Istora Mandiri", "Bendungan Hilir", "Setiabudi Astra", "Dukuh Atas BNI", "Bundaran HI"]
    
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
                        Text("Buy Ticket")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.black)
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
                    Picker(selection: $selectedSegment, label: Text("Choose a Segment")) {
                        Text("One Way Trip").tag(0)
                        Text("Round Trip").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // Departure Station
                    Text("Departure Station")
                        .foregroundColor(Color("neutral-80"))
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(.top, 8)
                    Picker(selection: $selectedDepartureStationIndex, label: Text("")) {
                        ForEach(0..<stations.count) { index in
                            Text(self.stations[index])
                                .foregroundColor(Color.black)
                                .tag(index)
                        }
                    }
                    .font(.subheadline)
                    .padding(.top, 8)

                    // Arrival Station
                    Text("Arrival Station")
                        .foregroundColor(Color("neutral-80"))
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(.top, 8)
                    Picker(selection: $selectedArrivalStationIndex, label: Text("")) {
                        ForEach(0..<stations.count) { index in
                            Text(self.stations[index]).tag(index)
                        }
                    }
                    .foregroundColor(Color.black)
                    .font(.subheadline)
                    .padding(.top, 8)
                    
                    .padding(.top, 8)
                    
                    // Inside your VStack
                    Text("Do you need any wheelchair assistance?")
                        .foregroundColor(Color("neutral-80"))
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(.top, 8)
                    Toggle(isOn: $needsWheelchairAssistance) {
                        Text(needsWheelchairAssistance ? "Yes" : "No")
                    }
                    .padding(.top, 8)
                    
                    Text("Estimated Time of Arrival")
                        .foregroundColor(Color("neutral-80"))
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(.top, 8)
                    DatePicker("", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                        .padding(.top, 8)
                    
                    Button (action: {
                        //TODO: DO SOMETHING MAGIC
                        if !isDisabled{
                            print("do Some Magic")
                            dismiss()
                        }
                    }, label: {
                        if isDisabled {
                            Text("Purchase")
                                .padding(.vertical, 16)
                                .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: 50)
                                .font(.system(size: 17,weight: .medium))
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(12)
                        }else{
                            Text("Purchase - IDR 13.000")
                                .padding(.vertical, 20)
                                .frame(maxWidth: .greatestFiniteMagnitude,maxHeight: 50)
                                .font(.system(size: 17,weight: .medium))
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    })
                    .padding(.top, 16)
                }
                .padding(.horizontal, 16)
                
            }
            .frame(maxWidth:.greatestFiniteMagnitude)
            .padding(.horizontal, 16)
        }
        .cornerRadius(8, corners: [.topLeft,.topRight])
        .onAppear {
            ticketListDetailViewModel.getProfile()
            ticketListDetailViewModel.getTodayDate()
        }
    }
}


struct TicketListDetailViews_Previews: PreviewProvider {
    static var previews: some View {
        TicketListDetailViews()
    }
}
