//
//  DetailViewController.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 19/03/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
 
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var textView: UITextView!
  var video:Video?
  override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
  override func viewWillAppear(_ animated: Bool) {
    titleLabel.text = ""
    dateLabel.text = ""
    textView.text = ""
    
    // cek apakah ada video
    guard video != nil else {
      return
    }
    
    // create the embed url
    let embedUrlString = Contsants.YT_EMBED_URL + video!.videoId
    
    // load it into webview
    let url = URL(string: embedUrlString)
    let request = URLRequest(url: url!)
    webView.load(request)
    
    // set th title
    titleLabel.text = video!.title
    
    // set the date
    let df = DateFormatter()
    df.dateFormat = "EEEE, MMM d, yyyy"
    dateLabel.text = df.string(from: video!.published)
    
    // set the textView
    textView.text = video!.description
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
