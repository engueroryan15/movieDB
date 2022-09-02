//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getMovieData(movieData: MovieData){
        print(movieData)
        DispatchQueue.main.async {
            self.title = movieData.title
            self.movieImageView?.downloaded(from: Constant.Endpoint.imageBasePath+movieData.poster_path)
            self.movieTitleLbl?.text = movieData.title
            self.movieOverviewTextView?.text = movieData.overview
        }
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
