//
//  MoviewDetailsController.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 21.11.2022.
//

import UIKit

class MovieDetailsController: UIViewController {
    var viewModel : MovieDetailsDelegate!
    let inset : CGFloat = 16
    var width : CGFloat {
        return UIScreen.main.bounds.size.width - self.inset * 2
    }
    
    var movieTitleLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var moviePreviewImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        viewModel = MovieDetailsViewModel(movie: movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.title
        setupUI()
    }
    
    func setupUI(){
        setupPreview()
        setupTitleLabel()
    }
    
    func setupPreview(){
        view.addSubview(moviePreviewImageView)
        moviePreviewImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moviePreviewImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset).isActive = true
        moviePreviewImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        moviePreviewImageView.heightAnchor.constraint(equalToConstant: 1.5*width).isActive = true
        moviePreviewImageView.image = #imageLiteral(resourceName: "placeholder")
        guard let url = viewModel.imageUrl else { return }
        moviePreviewImageView.downloadImage(fromUrl: url)
    }
    
    func setupTitleLabel(){
        view.addSubview(movieTitleLabel)
        movieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieTitleLabel.topAnchor.constraint(equalTo: moviePreviewImageView.bottomAnchor, constant: inset).isActive = true
        movieTitleLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        movieTitleLabel.text = viewModel.movieName
    }
}
