//
//  ConstantSample.swift
//  YouTube One Day App
//
//  Created by Sergey A on 05.03.2024.
//

import Foundation

struct ConstantSample {
    // Where you see Constant.property, use ConstantSample.property instead
    
    // Use your own API_Keys
    // Add the playlist id you like
    
    static var API_KEY = "YOUR_API_KEY"
    static var PLAYLIST_ID = "Playlist_ID"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
    static var VIDEOCELLID = "VideoCell"

}
