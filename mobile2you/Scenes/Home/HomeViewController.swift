//
//  HomeViewController.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 11/10/21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    // MARK: Properties
    var HomeViewModel: HomeModel = HomeModel()
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
        HomeViewModel.apiPoster()
        bind()
        setupCell()
        
    }
    
    // MARK: Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            buttonStyle.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 0, weight: .bold, scale: .large)), for: [])
        } else {
            buttonStyle.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 0, weight: .bold, scale: .large)), for: [])
        }
    }
    
    // MARK: Methods
    func setupCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func setupPosterMovie() {
        let popularityOpcional = HomeViewModel.getPopular()
        let likesOpcional = HomeViewModel.getLikes()
        let imageOpcional = HomeViewModel.getImage()
        guard let popularity = popularityOpcional, let likes = likesOpcional, let image = imageOpcional else { return }
        labelPopular.text = String(popularity)
        labelLikes.text = String(likes)
        let ur = URL(string: "https://image.tmdb.org/t/p/w500/\(image)")!
        imageViewPoster.kf.setImage(with: ur)
        
    }
    
    func bind() {
        HomeViewModel.update = { [weak self] in
            DispatchQueue.main.async {
                self?.setupPosterMovie()
            }
        }
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
