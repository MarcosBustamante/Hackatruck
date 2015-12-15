//
//  ProfileViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tabelaTags: UITableView!
    @IBOutlet weak var imgPerfil: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelReais: UILabel!
    
    
    @IBAction func addTags(sender: AnyObject) {
        
    
        let alert = UIAlertView()
        alert.title = "Adicione a tag"
        alert.addButtonWithTitle("Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.addButtonWithTitle("Cancel")
        let textField = alert.textFieldAtIndex(0)
        textField?.placeholder = "Tag"
        
        alert.show()
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
