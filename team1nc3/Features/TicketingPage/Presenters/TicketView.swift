import SwiftUI

struct Ticketing: Identifiable {
    let id = UUID()
    let departureStation: String
    let arrivalStation: String
    let eta: Date
    let wheelchairAssistanceNeeded: Bool
    let purchaseTime: Date
}

struct TicketView: View {
    @State private var selectedSegment = 0
    @State private var showSheet = false
    @State var detentHeight: CGFloat = 0

    // Sample purchased tickets
    @State var purchasedTickets: [Ticketing] = [
        Ticketing(departureStation: "HJN", arrivalStation: "SSM", eta: Date(), wheelchairAssistanceNeeded: true, purchaseTime: Date())
        // Add more sample tickets as needed...
    ]

    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }

    var dateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("Choose a Segment")) {
                Text("Ticket").tag(0)
                Text("Assistance").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedSegment == 0 {
                if purchasedTickets.isEmpty {
                    Spacer()
                    Text("You Have No Purchased Tickets")
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(purchasedTickets) { ticket in
                            VStack(alignment: .leading) {
                                Text("\(ticket.departureStation) ➔ \(ticket.arrivalStation)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("ETA: \(timeFormatter.string(from: ticket.eta))")
                                    .font(.subheadline)
                                if ticket.wheelchairAssistanceNeeded {
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
                            }
                            .padding()

                            HStack {
                                Spacer()
                                Text(" \(dateTimeFormatter.string(from: ticket.purchaseTime))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding([.horizontal, .bottom])
                        }
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
            } else if selectedSegment == 1 {
                Spacer()

                RequestPageView()
            }
        }
        .sheet(isPresented: $showSheet){
            TicketListDetailViews()
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height = height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
        }
    }
}

struct TicketView_Preview: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
