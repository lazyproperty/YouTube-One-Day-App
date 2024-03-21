//
//  Video.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import Foundation

struct Video: Decodable {
    
    var publishedAt = Date()
    var title = ""
    var description = ""
    var thumbnail = ""
    var videoId = ""
    
    
    enum CodingKeys: String, CodingKey {
        
        case snippet // : "publishedAt", "title", "description", "thumbnails", "resourceId"
        
        case publishedAt // = "publishedAt"
        case title
        case description
        case thumbnails  // : "high"
                                    case high // : "url" ( "thumbnail" )
                                                                        case thumbnail = "url"
        
        case resourceId // : "videoId"
                                        case videoId
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse the publish date
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
