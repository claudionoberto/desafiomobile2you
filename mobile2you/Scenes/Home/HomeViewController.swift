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
    var CellViewModel: CellModel = CellModel()
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
        bindPoster()
        CellViewModel.apiSimilarMovies()
        bindSimilarMovies()
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
        let titleOpcional = HomeViewModel.getTitle()
        guard let popularity = popularityOpcional, let likes = likesOpcional, let image = imageOpcional else { return }
        labelPopular.text = String(popularity) + " Views"
        labelLikes.text = String(likes) + " Likes"
        labelPoster.text = titleOpcional
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(image)")!
        imageViewPoster.kf.setImage(with: url)
        gradientImage()
        
    }
    
    func bindPoster() {
        HomeViewModel.updatePoster = { [weak self] in
            DispatchQueue.main.async {
                self?.setupPosterMovie()
            }
        }
    }
    
    func bindSimilarMovies() {
        CellViewModel.updateCell = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func gradientImage() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageViewPoster.frame
        let colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.colors = colors

        imageViewPoster.layer.addSublayer(gradientLayer)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellViewModel.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tv = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            let index = CellViewModel.movieIndex(indexPath.row)
            tv.setupMovies(index)
            return tv
        }
        
        return UITableViewCell(frame: .zero)
    }
    
    
}
