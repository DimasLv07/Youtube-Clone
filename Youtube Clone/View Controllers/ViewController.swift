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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // cek kalau video di pencet
    
    guard tableView.indexPathForSelectedRow != nil else {
      return
    }
    
    // get a reference to the video that was tapped on
    let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
    
    // get a reference to the detail view controller
    
    let detailVC = segue.destination as! DetailViewController
    
    // Set the video property of the detail view controller
    detailVC.video = selectedVideo
    
  }

  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
  }
}

