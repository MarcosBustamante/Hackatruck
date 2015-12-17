//
//  PedirTutorialView.swift
//  Telas
//
//  Created by Student on 12/16/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class PedirTutorialView: UIViewController {
    
    @IBOutlet weak var labelTags: UITextField!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var labelTitulo: UITextField!
    
    var parentView: HomeViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if parentView == nil {
            showAlert("Alerta", message: "Faltou o ParentViewController")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHome(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func PedirNovoTutorial(sender: AnyObject) {
        let tags = self.labelTags.text!
        let titulo = self.labelTitulo.text!
        let descricao = self.textViewDescricao.text!
        
        if tags == "" || titulo == "" || descricao == "" {
            self.showAlert("Alerta", message: "Preencha todos os campos")
            return
        }
        
        Tutoriais.pedirTutorial(titulo, descricao: descricao, tags: tags)
        
        self.parentView.alert = "NovoTutorialSucesso"
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
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
