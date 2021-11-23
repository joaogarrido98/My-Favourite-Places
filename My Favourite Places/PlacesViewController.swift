//
//  PlacesViewController.swift
//  My Favourite Places
//
//  Created by Joao Garrido on 18/11/2021.
//

import UIKit

class PlacesViewController: UITableViewController {
    let defaults = Defaults()
    var locationsArray : [Locations] = []
    var locationIndex = -1
   
    override func viewDidAppear(_ animated: Bool) {
        locationsArray = defaults.getLocations()
        if(locationsArray.count == 0){
            defaults.addLocation(location: Locations(name:"Ashton Building", lat: 53.406566 ,lon: -2.966531))
            locationsArray = defaults.getLocations()
        }
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        if(locationsArray[indexPath.row].name != nil){
            cell.textLabel?.text = locationsArray[indexPath.row].name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            locationsArray.remove(at: indexPath.row)
            defaults.deleteLocation(index: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "fromCellToMap"){
            let destination = segue.destination as! ViewController
            destination.location = locationsArray[table.indexPathForSelectedRow!.row]
        }
        if(segue.identifier == "toMap"){
            print("hello hun")
        }
    }
    
    @IBOutlet var table: UITableView!
}
