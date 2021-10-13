//
//  HomeViewController.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 11/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    let movieID = ""
    // MARK: Outlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelPoster: UILabel!
    @IBOutlet weak var buttonStyle: UIButton!
    @IBOutlet weak var labelLikes: UILabel!
    @IBOutlet weak var labelPopular: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Actions
    @IBAction func buttonAction(_ sender: Any) {
    }
    
    // MARK: Methods
    
}
