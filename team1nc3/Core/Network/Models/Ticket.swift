//
//  Ticket.swift
//  CatAPIProject
//
//  Created by Rizki Samudra on 22/07/23.
//

import Foundation

struct Ticket: Codable {

    let ticket_id: Int?
    let departure_station_name: String?
    let arrival_station_name: String?
    let purchase_date: String?
    let ETA: String?
    let user_name: String?
    let user_email: String?
}
