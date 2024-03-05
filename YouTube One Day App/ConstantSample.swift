//
//  ConstantSample.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import Foundation

struct ConstantSample {
    
    // Use your own API_Keys
    
    static var API_KEY = "[YOUR_API_KEY]"
    static var PLAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&id=\(ConstantSample.PLAYLIST_ID)&key=\(ConstantSample.API_KEY)"

}
