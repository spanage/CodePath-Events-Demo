//
//  ViewController.swift
//  FormsDemo
//
//  Created by Sommer Panage on 2/8/15.
//  Copyright (c) 2015 Sommer Panage. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate : class {
    func filterViewController(viewController: ViewController, didSetFilters filters: [Int : Bool])
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: FilterViewControllerDelegate?
    private var filterValues = [Int : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40;
    }
    
    @IBAction func didTapClose(sender: AnyObject) {
        delegate?.filterViewController(self, didSetFilters: filterValues)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell;
        cell.delegate = self
        
        if let filterValue = filterValues[indexPath.row] {
            cell.filterSwitch.on = filterValue
        } else {
            cell.filterSwitch.on = true
        }
        
        cell.filterLabel.text = "Filter \(indexPath.row + 1)"
        
        // The syntax below is an alternative to that above. ?? is a handy Swift
        // shortcut to unwrap an option or give it a default value.
        
        //var filterValue = filterValues[indexPath.row] ?? true
        //cell.filterSwitch.on = filterValue
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func filterCell(filterCell: FilterCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(filterCell)!
        
        filterValues[indexPath.row] = value
    }

}

