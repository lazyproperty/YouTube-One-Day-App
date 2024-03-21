//
//  Model.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched (_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
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
            
            // Check if there were any data and no errors
            if error != nil && data == nil {
                return
            }
            
            do {
                
                // Parsing the data into a video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(ItemResponse.self, from: data!)
                
                if  response.items != nil {
                
                    DispatchQueue.main.async {
                        
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                dump(response)
                
            } catch {
            
            }
        }
        
         dataTask.resume()
    }
}
