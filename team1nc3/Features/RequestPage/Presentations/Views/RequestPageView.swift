//
//  RequestPageView.swift
//  team1nc3
//
//  Created by Juli Yanti on 20/07/23.
//

import SwiftUI

struct RequestPageView: View {
    
    @State var selected: Bool = false
    let dummyMRTUser = MRTSpecialUser.getDummyData()
    @State private var dataUser: ProfileUser? = nil
    
    // Step 1: Initialize the APIFetcher
    @StateObject var apiFetcher = APIFetcher()
    
    // To hold the received data
    @State private var specialUser: MRTSpecialUser?
    @State private var errorMessage: String?
    
    @State var dataTicketsDD: [String] = []
    @State var dataStationsDD: [String] = []
    @State var dataAssistiveToolsDD: [String] = []
    @State var fullName: [String] = []
    @State var email: [String] = []
    @State private var selectedTrip: Ticket? = nil
    @State private var selectedAssistiveTools: AssistiveTools? = nil
    @State private var selectedTime = Date()
    
    @State var assistiveTools: [AssistiveTools] = []
    @State var tickets: [Ticket] = []
    @State private var isPresentingAlert: Bool = false
    
    
    /*
     Need to call API
     SpecialUser Budi Santoso / parameter dan payload request
     Ticket
     ETA + time picker
     Assistive Tool
     */
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    VStack {
                        Image(systemName: "sun.min.fill").resizable().scaledToFit().frame(width: 100, height: 100)
                    }
                    Spacer()
                    VStack (spacing: 0){
                        MenuSection(sectionHeaderTitle: "Full Name") {
                            Text(dataUser?.name ?? "").font(.body)
                            Divider()
                        }
                        
                        MenuSection(sectionHeaderTitle: "Phone Number") {
                            Text(dataUser?.phone ?? "").font(.body)
                            Divider()
                        }
                        
                        
                        MenuSection(sectionHeaderTitle: "Trip") {
                            // Dropdown Trip from all today's ticket
                            DropDownView(dataOptions: $dataTicketsDD ,completionHandler: { i in
                                
                                selectedTrip = tickets[i]
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                                selectedTime =
                                dateFormatter.date(from: tickets[i].ETA ?? "") ?? Date()
                            })
                            Divider()
                        }
                        
                        
                        MenuSection(sectionHeaderTitle: "Estimated Time of Arrival") {
                            // Dropdown ETA from column ETA
                            //                            DropDownView(dataOptions: $dataTicketsDD ,completionHandler: { i in
                            //
                            //                            })
                            DatePicker("", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                                .labelsHidden()
                                .disabled(true)
                                .padding(.top, 8)
                            Divider()
                        }
                        
                        MenuSection(sectionHeaderTitle: "Types of help needed") {
                            // assistive tool
                            DropDownView(dataOptions: $dataAssistiveToolsDD ,completionHandler: { i in
                                selectedAssistiveTools = assistiveTools[i]
                            })
                            
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
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                        dateFormatter.locale = Locale(identifier: "id")
                        
                        var data: [String:Any] = [:]
                        data["ticket_id"] = selectedTrip?.ticket_id
                        data["assistive_tool_id"] =   selectedAssistiveTools?.id
                        
                        apiFetcher.postDataNewRequest(parameter: data, completionData: {data, err in
                            print(data)
                            isPresentingAlert = true
                        })
                        
                        
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
        }.alert("Staaf is on the way.", isPresented: $isPresentingAlert, actions: {
            
        })
        .onAppear {
            fetchingUser()
            fetchTicket()
            fetchAssistiveTools()
            
            
        }
    }
    
    private func fetchingUser() {
        apiFetcher.fetchUserProfile(completionData: {data, err in
            //            print("datadata1: \(data?.message)")
            //            print("datadata2: \(err)")
            DispatchQueue.main.async {
                
                dataUser = data?.message ?? ProfileUser(name: "", email: "", phone: "", dob: "", gender: "", id_card_number: "", disability: "")
            }
            
        })
    }
    
    
    private func fetchTicket() {
        apiFetcher.fetchTicketDummy(completionData: {data, err in
            tickets = data?.message ?? []
            dataTicketsDD = []

            if(tickets.count > 0){
                selectedTrip = tickets[0]
            }
            for t in tickets  {
                self.dataTicketsDD.append("\(t.departure_station_name ?? "") - \(t.arrival_station_name ?? "")")
            }
        })
    }
    
    
    private func fetchAssistiveTools() {
        apiFetcher.fetchAssistiveTools(completionData: {data, err in
            assistiveTools = data?.message ?? []
            dataAssistiveToolsDD = []
            if(assistiveTools.count > 0){
                selectedAssistiveTools = assistiveTools[0]
            }
            for t in assistiveTools  {
                self.dataAssistiveToolsDD.append("\(t.tool_name ?? "")")
            }
        })
    }
    
}

struct RequestPageView_Previews: PreviewProvider {
    static var previews: some View {
        RequestPageView()
    }
}
