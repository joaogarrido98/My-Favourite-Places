//
//  PlacesViewController.swift
//  My Favourite Places
//
//  Created by Ilkin Samedzade on 18/11/2021.
//

import UIKit

var places = [[String : String]()]

class PlacesViewController: UITableViewController {
   
    override func viewDidAppear(_ animated: Bool) {
        if(places.count == 1 && places[0].count == 0){
            places.remove(at: 0)
            places.append(["name":"Ashton Building", "lat":"53.406566","lon": "-2.966531"])
        }
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        if(places[indexPath.row]["name"] != nil){
            cell.textLabel?.text = places[indexPath.row]["name"]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMap", sender: nil)
    }
    
    @IBOutlet var table: UITableView!
}
