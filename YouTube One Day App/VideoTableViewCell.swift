//
//  VideoTableViewCell.swift
//  YouTube One Day App
//
//  Created by Sergey A on 10.04.2024.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        // Ensure that we have the video
        guard self.video !=  nil else {
            return
        }
        
        // set the title and date label
        
        self.titleLabel.text = video?.title
        
        // formating date to String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        
        self.dateLabel.text = formatter.string(from: video!.publishedAt)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }

        //Check cache
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
             
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { ( data, response, error ) in
            if error == nil && data != nil {
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                
                if url!.absoluteString != self.video!.thumbnail {
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        //Start data task
        dataTask.resume()
    }

}
