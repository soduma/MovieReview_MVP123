//
//  ViewController.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieManager().fetchMovie(from: "겨울왕국") { movies in
            print(movies)
        }
    }
}
