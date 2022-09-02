//
//  MovieModel.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import Foundation
import UIKit

class MovieModel: NSObject {

    private var apiService : APIService!
    private(set) var movieData : Movie! {
        didSet {
            self.bindMovieViewModelToController()
        }
    }
    var pageNo : Int = 1
    
    var bindMovieViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        getMovieList()
    }
    
    func getMovieList() {
        self.apiService.getMovieList(pageNo: pageNo) { (movieData) in
            self.movieData = movieData
            print(movieData)
        }
    }
    
    func loadMore(pageNo: Int) {
        self.pageNo = pageNo
        self.apiService.getMovieList(pageNo: self.pageNo) { (movieData) in
            self.movieData.results.insert(contentsOf: movieData.results, at: self.movieData.results.count)
            print(movieData)
        }
    }
}
