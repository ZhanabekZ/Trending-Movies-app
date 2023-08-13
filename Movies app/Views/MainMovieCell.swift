//
//  MainMovieCell.swift
//  Movies app
//
//  Created by ZhZinekenov on 23.07.2023.
//

import UIKit

class MainMovieCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    let movieImageView = UIImageView()
    let titleLabel = UILabel()
    let scoreLabel = UILabel()
    let releaseDateLabel = UILabel()
    let containerView = UIView()
    
    func setupCell(viewModel: MovieCellViewModel) {
        self.titleLabel.text = viewModel.title
        self.scoreLabel.text = viewModel.rating
        self.releaseDateLabel.text = viewModel.date
        ImageDownloader.getImageFromURL(viewModel.imageURL!) { image in
            if let image = image {
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                }
            } else {
                self.movieImageView.image = UIImage()
            }
        }
    }
    private func commonInit() {
        backgroundColor = .systemMint
        
        contentView.backgroundColor = .clear
        containerView.round()
        containerView.addBorder(color: .label, width: 0.5)
        containerView.backgroundColor = .white
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)
        containerView.addSubview(movieImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(scoreLabel)
        containerView.addSubview(releaseDateLabel)
        
        movieImageView.round(5)
        
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        
        releaseDateLabel.font = .systemFont(ofSize: 17)
        
        scoreLabel.font = .preferredFont(forTextStyle: .headline)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            
            movieImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            movieImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            movieImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            movieImageView.widthAnchor.constraint(equalToConstant: 90),
            movieImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            scoreLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            scoreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            releaseDateLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            releaseDateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            releaseDateLabel.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: -8)
        ])
    }
}
