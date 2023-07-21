//
//  TicketDetailViewModel.swift
//  team1nc3
//
//  Created by Rizki Samudra on 18/07/23.
//

import Foundation
import SwiftUI

class TicketDetailViewModel: ObservableObject, Identifiable {
   
  @Published  var ticketSample: TicketingModel? = nil
  @Published  var todayDate: String? = nil
    
    
    func getProfile() {
        ticketSample = TicketRepositorySample().ticketDataModel
    }
    
    
    func getTodayDate (){
        let date: Date = Date()
        let df = DateFormatter()

        df.dateStyle = DateFormatter.Style.full
        df.timeStyle = DateFormatter.Style.short

        todayDate = df.string(from: date)
    }
}
