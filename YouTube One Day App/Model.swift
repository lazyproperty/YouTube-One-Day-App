//
//  Model.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Create a URL Session object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any data
            if error != nil && data == nil {
                return
            }
            
            // Parsing the data into a video object
            
            
        }
        
         dataTask.resume()
    }
    
    
}
