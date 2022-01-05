//
//  ViewController.swift
//  Desafio DeviOS jr - M2y
//
//  Created by Carlos Duran on 29/12/21.
//

import UIKit
import Alamofire
import SafariServices

final class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tField: UITextField!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MoviesTableViewCell.nib(), forCellReuseIdentifier: MoviesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 181
        tField.delegate = self
    
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBox()
        return true
    }
    
    func searchBox() {
        tField.resignFirstResponder()
        
        guard let text = tField.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "+")
    
        movies.removeAll()
        
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=7e92ad228e12b5777ac87e893f2d4091&query=\(query)")!,
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            //let nextView = DetailViewController()
              //self.present(nextView, animated: true, completion: nil)
        
        let url = "https://www.themoviedb.org/movie/\(movies[indexPath.row].id)/"
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true)
    }
    
}
