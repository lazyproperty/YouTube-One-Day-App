//
//  ViewController.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set ViewController as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    
    // MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        // Set the return video to our video property
        self.videos = videos
        
        // Refresh the table view
        tableView.reloadData()
    }
}


// MARK:  - UITableViewDataSource Methods

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        // Get the title for the video in question
        
       // let title = self.videos[indexPath.row].title
       // cell.textLabel?.text = title
        
        let video = self.videos[indexPath.row]

        cell.setCell(video)
        
        
        // Return the Cell
        return cell
    }
}


// MARK: - UITableViewDelegate Methods

extension ViewController: UITableViewDelegate {
    
    
}

