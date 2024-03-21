//
//  ItemResponse.swift
//  YouTube One Day App
//
//  Created by Sergey A on 14.03.2024.
//

import Foundation

struct ItemResponse: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
