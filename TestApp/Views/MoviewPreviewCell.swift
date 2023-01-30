//
//  MoviewPreviewCell.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 21.11.2022.
//

import UIKit

class MoviewPreviewCell: UITableViewCell {
    static var identifier = "movie"
    var inset : CGFloat = 8
    var imageHeight : CGFloat = 90
    var imageWidth : CGFloat = 60
    
    var movieTitleLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var movieRankLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movie : Movie? {
        didSet {
            if movie != oldValue {
                movieImageView.image = #imageLiteral(resourceName: "placeholder")
                movieTitleLabel.text = movie?.title
                movieRankLabel.text = movie?.rank
                if let imageUrl = movie?.image {
                    movieImageView.downloadImage(fromUrl: URL(string: imageUrl)!)
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieRankLabel)
        movieRankLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset).isActive = true
        movieRankLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset).isActive = true
        movieRankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2*inset).isActive = true
        movieRankLabel.widthAnchor.constraint(equalToConstant: imageWidth/2).isActive = true
        movieRankLabel.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        
        
        contentView.addSubview(movieImageView)
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: movieRankLabel.trailingAnchor, constant: inset).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        movieImageView.image = #imageLiteral(resourceName: "placeholder")
        
        
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset).isActive = true
        movieTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: inset).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
