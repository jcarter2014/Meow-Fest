//
//  TableViewController.swift
//  Meow Fest
//
//  Created by John Carter on 6/12/18.
//  Copyright © 2018 Jack Carter. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    struct Cat {
        let title: String?
        let date: String?
        let imageURL: UIImage?
        let description: String?
    }
    
    
    
    var cats = [Cat]()
    
    let url = "https://chex-triplebyte.herokuapp.com/api/cats?page=0"
    
    func getCats() {
        Alamofire.request(url).responseJSON { (response) in
            //print(response)
            
            if let JSON = response.result.value as? [[String: Any]]{
                //print(JSON)
                for eachCat in JSON {
                    let firstURL = eachCat["image_url"] as! String
                    let catURL = URL(string: firstURL)
                    let data = try? Data(contentsOf: catURL!)
                    
                    let currentCat = Cat(title: eachCat["title"] as! String, date: eachCat["timestamp"] as! String, imageURL: UIImage(data: data!), description: eachCat["description"] as! String)
                    
                    self.cats.append(currentCat)
                }
                
            }
            print(self.cats)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        //cell?.textLabel?.text = cats[indexPath.row].title
        cell?.date.text = cats[indexPath.row].date
        cell?.title.text = cats[indexPath.row].title
        cell?.descriptionOfCat.text = cats[indexPath.row].description
        cell?.catImage.image = cats[indexPath.row].imageURL
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCats()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

