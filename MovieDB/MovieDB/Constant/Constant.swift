//
//  Constant.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import Foundation

struct Constant{
    struct ApiKey{
        static let key = "e46c0b52c3088cd1aedf3c39a3d7f30b"
    }
    
    struct AccessToken {
        static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDZjMGI1MmMzMDg4Y2QxYWVkZjNjMzlhM2Q3ZjMwYiIsInN1YiI6IjYzMTA5MmUwMTUxMWFhMDA3YmEyZjUwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.O8PB859TT142F1u0iptQbpG8Nh3npy5ar_lKi100xX8"
    }
    
    struct Endpoint {
        static let movieListURL = "https://api.themoviedb.org/4/list/1?"
        static let imageBasePath = "https://image.tmdb.org/t/p/w500"
    }
}
