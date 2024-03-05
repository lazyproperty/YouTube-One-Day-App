//
//  ViewController.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

