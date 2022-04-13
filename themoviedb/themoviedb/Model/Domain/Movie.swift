//
//  Movie.swift
//  themoviedb
//
//  Created by facundo veronesi on 13/04/2022.
//

import Foundation

struct Movie: Decodable {
    var backdrop_path: String
    init(backdrop_path: String){
        self.backdrop_path = backdrop_path
    }
}
