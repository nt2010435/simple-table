//
//  ViewController.swift
//  Simple Table
//
//  Created by Nicholas Tran on 1/18/17.
//  Copyright © 2017 NT Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    //construct table view cell with identifier to populate the row
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.subtitle, //cell layout
                reuseIdentifier: simpleTableIdentifier)
        }
        
        //add image to the row and change to 'star2' when row selected
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        return cell!
    }

    //Specify first row not selectable
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
            //set first row to non selectable
            //return indexPath.row == 0 ? nil : indexPath
            
            //set first row not selectable, when select odd row - next even row gets selected
            if indexPath.row == 0 {
                return nil
            } else if (indexPath.row % 2 == 0){
                return NSIndexPath(row: indexPath.row + 1,
                                   section: indexPath.section) as IndexPath
            } else {
                return indexPath
            }
    }
    
    //method to handle selection of the row
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        let controller = UIAlertController(title: "Row Selected",
                                           message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I Did",
                                   style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}

