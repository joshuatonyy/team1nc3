//
//  SettingView.swift
//  team1nc3
//
//  Created by Joshua on 19/07/23.
//

import SwiftUI

struct SettingView: View {
    @State private var isEnglish = true
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    NavigationLink(destination: AccountPageViews()) {
                        Label("Profile", systemImage: "person")
                    }
                    
                    NavigationLink(destination: PaymentView()) {
                        Label("Payment", systemImage: "dollarsign.circle")
                    }
                    
                    NavigationLink(destination: CardsView()) {
                        Label("Cards", systemImage: "creditcard")
                    }
                    
                    NavigationLink(destination: ActivityHistoryView()) {
                        Label("Activity History", systemImage: "clock")
                    }
                    
                    NavigationLink(destination: NotificationView()) {
                        Label("Notification", systemImage: "bell")
                    }
                    
                    HStack {
                        Label("Languages", systemImage: "captions.bubble")
                        Spacer()
                        Toggle(isOn: $isEnglish) {
                            Text(isEnglish ? "EN" : "ID")
                        }
                        .labelsHidden()
                    }
                    
                    NavigationLink(destination: TermsConditionsView()) {
                        Label("Terms and Conditions", systemImage: "book")
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Label("Privacy Policy", systemImage: "shield")
                    }
                    
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    // Empty toolbar item to hide the navigation bar
                                }
                            }
    }
        }
    }
}

struct PaymentView: View {
    var body: some View {
        Text("Payment View")
    }
}

struct CardsView: View {
    var body: some View {
        Text("Cards View")
    }
}

struct ActivityHistoryView: View {
    var body: some View {
        Text("Activity History View")
    }
}

struct NotificationView: View {
    var body: some View {
        Text("NotificationView")
    }
}


struct TermsConditionsView: View {
    var body: some View {
        Text("TermsConditionsView")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        Text("PrivacyPolicyView")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
