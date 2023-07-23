//
//  APIMethod.swift
//  team1nc3
//
//  Created by Juli Yanti on 23/07/23.
//

import Foundation

enum APIMethod: CustomStringConvertible {
    case POST
    case GET
    // PUT for Update
    case PUT
    case DELETE
    
    
    var description: String {
        //info for debugging
        switch self {
        case .POST: return "POST"
        case .GET: return "GET"
        case .PUT: return "PUT"
        case .DELETE: return "DEL"
       
        }
    }
}
