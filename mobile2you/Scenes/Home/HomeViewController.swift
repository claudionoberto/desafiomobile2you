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
        setupCell()
        
    }
    
    // MARK: Actions
    @IBAction func buttonAction(_ sender: Any) {
    }
    
    // MARK: Methods
    func setupCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tv = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return tv
    }
    
    
}
