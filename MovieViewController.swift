//
//  MovieViewController.swift
//  SampleApp
//
//  Created by Andy on 11/19/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var movieTable: UITableView!
    var data : [[String: AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchIMDB(forText: "The Matrix")
    }
    
    func searchIMDB(forText: String) {
        let spacelessString = forText.addingPercentEscapes(using: String.Encoding.utf8)
        
        if let foundString = spacelessString {
            
            let urlPath = URL(string: "https://www.omdbapi.com/?s=\(foundString)")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlPath!){
                
                dataVal, response, error -> Void in
                
                if (error != nil) {
                    print(error?.localizedDescription ?? "Error")
                }
                
                do {
                    
                let jsonVal = try JSONSerialization.jsonObject(with: dataVal!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                self.data = jsonVal["Search"] as! [[String: AnyObject]]
                    
                print(self.data)
                print(self.data.count)
                print(self.data.description)
                print(self.data[0]["Title"] ?? "Unkown")
                    
                //reload the table since data is loaded
                self.movieTable.reloadData()
                    
                } catch {
                    print(error)
                }
            }
            
            task.resume()
        }
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]["Title"] as! String?
        cell.detailTextLabel?.text = data[indexPath.row]["Year"] as! String?
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
