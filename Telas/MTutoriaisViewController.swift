//
//  SecondViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class MTutoriaisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentAbas: UISegmentedControl!
    @IBOutlet weak var tableMT: UITableView!
    var tutoriais = [[String: String]]()
    var filtered = [[String: String]]()
    
    override func viewDidLoad() {
        
        
        self.tutoriais = Tutoriais.listarTutoriais()
        
        self.tableMT.dataSource = self
        self.tableMT.delegate = self
        

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        return UITableViewCell()
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        
       //switch segmentAbas.selectedSegmentIndex{
       // case 0:
           // filtered =
            
       // }
        
    }
    


}

