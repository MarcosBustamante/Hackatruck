//
//  VisualizacaoTutoriaisView.swift
//  Telas
//
//  Created by Student on 12/16/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class VisualizacaoTutoriaisView: UIViewController {
    
    @IBOutlet weak var labelNomeTutorial: UILabel!
    @IBOutlet weak var labelNomeAutor: UILabel!
    @IBOutlet weak var labelVistoPor: UILabel!
    @IBOutlet weak var labelCurtidoPor: UILabel!
    @IBOutlet weak var textViewTutorial: UITextView!
    
    var tutorial = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelNomeAutor.text = self.tutorial["nome_autor"]
        self.labelNomeTutorial.text = self.tutorial["nome_tutorial"]
        self.textViewTutorial.text = self.tutorial["desc_tutorial"]
        self.labelVistoPor.text = self.tutorial["visto"]
        self.labelCurtidoPor.text = self.tutorial["likes"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTohome(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
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
