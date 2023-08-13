//
//  MainViewModel.swift
//  Movies app
//
//  Created by ZhZinekenov on 21.07.2023.
//

import Foundation
class MainViewModel {
    
    var isLoading: ObservableObject<Bool> = ObservableObject(false)
    var cellDataSource: ObservableObject<[MovieCellViewModel]> = ObservableObject([])
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value == true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Trending movies count: \(data.results.count)")
                self?.dataSource = data
                self?.cellMapData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellMapData() {
        self.cellDataSource.value = (self.dataSource?.results.compactMap({ MovieCellViewModel(movie: $0)}))!
    }
    
    func retrieveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { $0.id == id }) else {
            return nil
        }
        return movie
    }
}
