//
//  APIService.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import Foundation

class APIService :  NSObject {
    
    func getMovieList(pageNo: Int, completion : @escaping (Movie) -> ()){
        let url = URL(string: "\(Constant.Endpoint.movieListURL)page=\(pageNo)&api_key=\(Constant.ApiKey.key)")!
        var request = URLRequest(url: url)
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)

            let jsonDecoder = JSONDecoder()
            let movieData = try! jsonDecoder.decode(Movie.self, from:data)
            completion(movieData)
        }
    }
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
   
    
}

