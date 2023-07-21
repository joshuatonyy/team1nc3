//
//  ContentView.swift
//  team1nc3
//
//  Created by Joshua on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            TicketView()
                .tabItem{
                    Label("Ticket", systemImage: "ticket")
                }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TicketView: View {
    var body: some View {
        Text("Ticket View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
