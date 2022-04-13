//
//  ThemobiedbServices.swift
//  themoviedb
//
//  Created by facundo veronesi on 13/04/2022.
//

import Foundation
import Alamofire

final class ThemoviedbService {
    // init
    static let shared = ThemoviedbService()
    
    private enum ThemoviedbAPI {
        case movie(String)
        case movies
        
        func url() -> URL? {
            let apiUri = Constants.kThemoviedbUri
            let ApiKey = Constants.kApiKey
            switch self {
            case .movie(let id):
                return URL(string: "\(apiUri)movie/\(id)?api_key=\(ApiKey)")
            case .movies:
                return URL(string: "\(apiUri)movies?api_key=\(ApiKey)")
            }
            
        }
    }
    
    func getMovies(success: @escaping (_ movie: Movie) -> Void) {
        guard let url = ThemoviedbAPI.movies.url() else {
            return
        }
        AF.request(url)
            .responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        let asJSON = try JSONDecoder().decode(Movie.self, from: data)
                        success(asJSON)
                        // Handle as previously success
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    // Handle as previously error
                    print(error)
                    break
                }
        }
    }
    
    func getMovie(id: String, success: @escaping (_ movie: Movie) -> Void) {
        guard let url = ThemoviedbAPI.movie(id).url() else {
            return
        }
        AF.request(url)
            .responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        let asJSON = try JSONDecoder().decode(Movie.self, from: data)
                        success(asJSON)
                        // Handle as previously success
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    // Handle as previously error
                    print(error)
                    break
                }
        }
    }
}
