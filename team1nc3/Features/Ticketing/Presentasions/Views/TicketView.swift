import SwiftUI

struct TicketView: View {
    @State private var selectedSegment = 0
    @State private var showSheet = false
    @State var detentHeight: CGFloat = 0

    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("Choose a Segment")) {
                Text("Ticket").tag(0)
                Text("Assistance").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Spacer()

            Text("You Have No Purchased Tickets")
                .padding()

            Spacer()

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
