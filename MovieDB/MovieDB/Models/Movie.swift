//
//  Movie.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import Foundation

struct Movie: Decodable {
    var results: [MovieData]
}
    
struct MovieData: Decodable {
        let adult : Bool
        let backdrop_path : String
        let id : Int
        let media_type : String
        let original_language : String
        let original_title : String
        let overview : String
        let popularity : Float
        let poster_path : String
        let release_date : String
        let title : String
        let video : Bool
        let vote_count : Int
    
        enum CodingKeys: String, CodingKey {
            case adult
            case backdrop_path = "backdrop_path"
            case id
            case media_type = "media_type"
            case original_language = "original_language"
            case original_title = "original_title"
            case overview = "overview"
            case popularity
            case poster_path = "poster_path"
            case release_date = "release_date"
            case title = "title"
            case video
            case vote_count
        }
}



