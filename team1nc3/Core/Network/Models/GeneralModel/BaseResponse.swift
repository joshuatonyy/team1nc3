//
//  BaseResponse.swift
//  CatAPIProject
//
//  Created by Rizki Samudra on 20/07/23.
//

import Foundation

struct BaseResponse<T: Codable> : Codable {
    var message : T
    
    enum CodingKeys: String, CodingKey
    {
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(T.self, forKey: .message)
        
    }
}
