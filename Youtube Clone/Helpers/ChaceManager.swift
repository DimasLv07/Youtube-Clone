//
//  ChaceManager.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 18/03/21.
//

import Foundation

class ChaceManager  {

static var chace = [String:Data]()

  static func setVideoChace(_ url:String, _ data:Data?) {
    
    chace[url] = data
    
  }
  
  static func getVideoChace(_ url:String) -> Data? {
    return chace[url]
  }
  
}
