//
//  ViewController.swift
//  Youtube Clone
//
//  Created by dimas pendriansyah on 15/03/21.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  var model = Model()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    model.getVideo()

  }

}

