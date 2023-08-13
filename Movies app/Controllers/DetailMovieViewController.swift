//
//  DetailMovieViewController.swift
//  Movies app
//
//  Created by ZhZinekenov on 26.07.2023.
//

import UIKit

class DetailMovieViewController: UIViewController {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupUI()
        configView()
    }
    
    func setupUI() {
        imageView.contentMode = .scaleToFill
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = .preferredFont(forTextStyle: .title3)
        descriptionLabel.numberOfLines = 0

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        ImageDownloader.getImageFromURL(viewModel.movieImage!) { [weak self] image in
            if let image = image {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            } else {
                print("Failed to download or create the image.")
            }
        }
    }

}
