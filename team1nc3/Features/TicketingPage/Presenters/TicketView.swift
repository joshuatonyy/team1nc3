import SwiftUI

struct TicketView: View {
    @State private var selectedSegment = 0
    @State private var showSheet = false
    @State var detentHeight: CGFloat = 0
    @StateObject var apiFetcher = APIFetcher()
    @State private var isPresentingAlert: Bool = false
    @State var tickets: [Ticket] = []
    @State private var dataUser: ProfileUser? = nil
    
    
    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("Choose a Segment")) {
                Text("Ticket").tag(0)
                Text("Assistance").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            if(selectedSegment == 0) {
                if tickets.isEmpty {
                    Spacer()
                    Text("You Have No Purchased Tickets")
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(tickets.indices, id:\.self) { index in
                            VStack(alignment: .leading) {
                                Text("\(tickets[index].departure_station_name ?? "") ➔ \(tickets[index].arrival_station_name ?? "")")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Estimated Time of Arrival \(formatDateHoursOnly(date:dateStringToDate(dateString: tickets[index].ETA ?? "") ?? Date()))")
                                
                                if (dataUser?.disability ?? "") != "" {
                                    Text("Limited Range of Motion")
                                        .foregroundColor(Color.red)
                                        .font(.subheadline)
                                }
                                
                                Text("Staff is on the Way")
                                    .font(.subheadline)
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.green, lineWidth: 2)
                                            .background(Color.green.cornerRadius(12))
                                    )
                                    .foregroundColor(.white)
                                
                                HStack {
                                    Spacer()
                                    Text(" \(formatDate(date:dateStringToDate(dateString: tickets[index].purchase_date ?? "") ?? Date()))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding([.horizontal, .bottom])
                            }
                            .listRowSeparator(.hidden)

                            .padding()

                           
                        }
                        .listStyle(.plain)

                    }
                }


                Button(action: {
                    // Your button action here
                
                    showSheet = true
                }) {
                    Text("Buy Ticket")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding()
            }
            else if(selectedSegment == 1){
                Spacer()
                
                RequestPageView()
            }
        }
        .sheet(isPresented: $showSheet){
            TicketListDetailViews(isPresentingAlert: $isPresentingAlert)
            .readHeight()
            .onPreferenceChange(HeightPreferenceKey.self) { height in
                if let height = height {
                    self.detentHeight = height
                }
            }
            .presentationDetents([.height(self.detentHeight)])
    }
        .alert("Ticket bought.", isPresented: $isPresentingAlert, actions: {
            
        })
        .onAppear{
            fetchUser()
            fetchTicket()
        }
    }
    
    private func fetchUser(){
        apiFetcher.fetchUserProfile(completionData: {data, err in
            DispatchQueue.main.async {
                
                dataUser = data?.message ?? ProfileUser(name: "", email: "", phone: "", dob: "", gender: "", id_card_number: "", disability: "")
            }
        })
    }
    private func fetchTicket() {
        apiFetcher.fetchTicketDummy(completionData: {data, err in
            tickets = data?.message ?? []

        })
    }
    
    func dateStringToDate(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter.date(from: dateString)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func formatDateHoursOnly(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}

struct TicketView_Preview: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
