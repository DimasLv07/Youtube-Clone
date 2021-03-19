//
//  ViewController.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
  func videosFatched(_ videos: [Video]) {
    self.videos = videos
    
    tableView.reloadData()
  }
  
  
  @IBOutlet weak var tableView: UITableView!
  var model = Model()
  var videos = [Video]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    model.delegate = self
    
    // Do any additional setup after loading the view.
    model.getVideo()

  }
 
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Contsants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
    
    let video = self.videos[indexPath.row]
    
    cell.setCell(video)
    
    cell.textLabel?.text = title
    
    return cell
  }

  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
  }
}
