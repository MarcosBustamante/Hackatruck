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
    
    @IBOutlet weak var buttonLike: UIBarButtonItem!
    @IBOutlet weak var textViewTutoriaisEditavel: UITextView!
    @IBOutlet weak var textViewTutorial: UITextView!
    @IBOutlet weak var textFieldTags: UITextField!
    @IBOutlet weak var textFieldTitulo: UITextField!
    
    
    var tutorial = [String: String]()
    
   
    var pub = true
    var pedido = true
    var rascunho = true
    @IBAction func buttonLike(sender: AnyObject) {
        if pedido == true{
            //botao de like
        }
        if rascunho == true{
            //botao de publicar
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if pub == true
        {
        self.labelNomeAutor.text = self.tutorial["nome_autor"]
        self.labelNomeTutorial.text = self.tutorial["nome_tutorial"]
        self.textViewTutorial.text = self.tutorial["desc_tutorial"]
        self.labelVistoPor.text = self.tutorial["visto"]
        self.labelCurtidoPor.text = self.tutorial["likes"]
        Tutoriais.visto(self.tutorial["id"]!)
        self.buttonLike.title = "Like"
        self.buttonLike.enabled = false
        self.labelNomeAutor.hidden = false
        self.labelNomeTutorial.hidden = false
        self.labelCurtidoPor.hidden = false
        self.labelVistoPor.hidden = false
        self.textViewTutorial.hidden = false
        self.textViewTutoriaisEditavel.hidden = true
        self.textFieldTags.hidden = true
        self.textFieldTitulo.hidden = true
        
        }
        if rascunho == true{
            self.textFieldTitulo.text = self.tutorial["nome_tutorial"]
            self.textViewTutoriaisEditavel.text = self.tutorial["desc_tutorial"]
            self.textFieldTags.text = self.tutorial["tag"]
            self.buttonLike.title = "Publicar"
            self.buttonLike.enabled = true
            self.labelNomeAutor.hidden = true
            self.labelNomeTutorial.hidden = true
            self.labelCurtidoPor.hidden = true
            self.labelVistoPor.hidden = true
            self.textViewTutorial.hidden = true
            self.textViewTutoriaisEditavel.hidden = false
            self.textFieldTags.hidden = false
            self.textFieldTitulo.hidden = false
            
            
        }
        if pedido == true{
            self.labelNomeAutor.text = self.tutorial["nome_autor"]
            self.labelNomeTutorial.text = self.tutorial["nome_tutorial"]
            self.textViewTutorial.text = self.tutorial["desc_tutorial"]
            self.labelVistoPor.text = self.tutorial["visto"]
            self.labelCurtidoPor.text = self.tutorial["likes"]
            Tutoriais.visto(self.tutorial["id"]!)
            self.buttonLike.title = "Like"
            self.buttonLike.enabled = true
            self.labelNomeAutor.hidden = false
            self.labelNomeTutorial.hidden = false
            self.labelCurtidoPor.hidden = false
            self.labelVistoPor.hidden = false
            self.textViewTutorial.hidden = false
            self.textViewTutoriaisEditavel.hidden = true
            self.textFieldTags.hidden = true
            self.textFieldTitulo.hidden = true
            
        }
        
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
