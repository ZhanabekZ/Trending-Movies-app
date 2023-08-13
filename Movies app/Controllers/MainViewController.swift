//
//  MainViewController.swift
//  Movies app
//
//  Created by ZhZinekenov on 21.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var cellsDataSource: [MovieCellViewModel] = []
    let tableView = UITableView()
    let viewModel = MainViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies List"
        setupUI()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupBinders()
        viewModel.getData()
    }
    
    func setupBinders() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self else {
                return
            }
            self.cellsDataSource = movies
            self.reloadTableView()
            
        }
    }
    
    func openDetail(movieID: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieID) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsViewController = DetailMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
