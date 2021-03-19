//
//  VideoTableViewCell.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 18/03/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  var video:Video?
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  func setCell(_ v:Video) {
    self.video = v
    
    // cek apakah dara video ada
    guard self.video != nil else  {
      return
    }
    
    self.titleLabel.text = video?.title
    
    let df = DateFormatter()
    df.dateFormat = "EEEE, MMM d, yyyy"
    self.dateLabel.text = df.string(from: video!.published)
    
    
    // untk set gambar thumbnail
    guard self.video!.thumbnail != "" else {
      return
    }
    
    if let chacedData = ChaceManager.getVideoChace(self.video!.thumbnail){
      
      // untuk save data thumbnail
      self.thumbnailImageView.image = UIImage(data: chacedData)
      
      return
    }
    
    // untuk download gambar thumbnail
    let url = URL(string: video!.thumbnail)
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      
      // kalo gak ada error dan datanya ada
      if error == nil && data != nil{
        
        // Save gambarnya di chace
        ChaceManager.setVideoChace(url!.absoluteString, data)
        
        if url!.absoluteString != self.video?.thumbnail {
          return
        }
        
        let image = UIImage(data: data!)
        
        
        // untuk ngesave gambar secara asyncronus (paralel)
        DispatchQueue.main.async {
          self.thumbnailImageView.image = image
        }
      }
      
    }
    
    dataTask.resume()
  }
  
}


