//
//  Constants.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 15/03/21.
//

import Foundation

struct Contsants {
  static var API_KEY = "AIzaSyAVpl2CugmYOTgybzFFeh2zIPnJZbZJ6fo"
  static var PLAYLIST_ID = "PLCnD2jU_siVqx2aj7z4CLdDrP8WALoDQz"
  static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Contsants.PLAYLIST_ID)&key=\(Contsants.API_KEY)"
  
  static var VIDEOCELL_ID = "VideoCell"
  static var YT_EMBED_URL =
    "https://www.youtube.com/embed/"
}
