//
//  MainViewController.swift
//  FormsDemo
//
//  Created by Sommer Panage on 2/8/15.
//  Copyright (c) 2015 Sommer Panage. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, FilterViewControllerDelegate {

    @IBOutlet weak var offSwitchesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        offSwitchesLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newVC = (segue.destinationViewController as UINavigationController).topViewController as ViewController
        newVC.delegate = self
    }
    
    func filterViewController(viewController: ViewController, didSetFilters filters: [Int: Bool]) {
        var label = ""
        for (key, value) in filters {
            if (!value) {
                label += "Filter \(key + 1)\n"
            }
        }
        offSwitchesLabel.text = label
    }

}
