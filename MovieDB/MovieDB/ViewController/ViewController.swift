//
//  ViewController.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var movieTableView: UITableView!
    
    private var movieModel : MovieModel!
    
    private var dataSource : MovieTableViewDataSource<MovieTableViewCell,MovieData>!
    
    var pageNo : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initiateDataAndUI()
    }

    func initiateDataAndUI(){
        self.title = "MovieDB"
        
        self.movieModel = MovieModel()
        self.movieModel.bindMovieViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = MovieTableViewDataSource(cellIdentifier: "MovieTableViewCell", items: self.movieModel.movieData.results, configureCell: { (cell, movie) in
            cell.movieTitleLbl.text = movie.title
            cell.movieImage.downloaded(from: Constant.Endpoint.imageBasePath+movie.poster_path)
        })
        
        DispatchQueue.main.async {
            self.movieTableView.dataSource = self.dataSource
            self.movieTableView.delegate = self
            self.movieTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.getMovieData(movieData: self.movieModel.movieData.results[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            self.pageNo += 1
            self.movieModel.loadMore(pageNo: self.pageNo)
        }
    }
}

    

