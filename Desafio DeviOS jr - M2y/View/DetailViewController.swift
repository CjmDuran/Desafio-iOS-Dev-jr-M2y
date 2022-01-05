//
//  DetailViewController.swift
//  Desafio DeviOS jr - M2y
//
//  Created by Carlos Duran on 30/12/21.
//

import UIKit
import Alamofire

/*class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var movieNameD: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var imageViewD: UIImageView!
    
    var searchedMovie: Movie?
    var movies = [Movie]()
    var movieID: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MoviesTableViewCell.nib(), forCellReuseIdentifier: MoviesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 181
    
    }

    
    func similarMovies() {
        
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=7e92ad228e12b5777ac87e893f2d4091")!,
            completionHandler: { data, response, error in
                
            guard let data = data, error == nil else {
                return
            }
            var result: movieResult?
            do {
                result = try JSONDecoder().decode(movieResult.self, from: data)
            }
            
            catch {
                print("error")
            }
            
            guard let finalResult = result else {
                return
            }
            
            let newMovies = finalResult.results
            self.movies.append(contentsOf: newMovies)
             
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as! MoviesTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    }

*/  
