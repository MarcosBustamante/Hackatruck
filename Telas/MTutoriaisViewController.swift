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
    
    var publicados = [[String: String]]()
    var npublicados = [[String: String]]()
    var pedidos = [[String: String]]()
    
    
    override func viewDidLoad() {
        
        
        self.tutoriais = Tutoriais.listarTutoriais()
        for var tutorial in self.tutoriais{
            if tutorial["publicado"]=="1"{
                self.publicados.append(tutorial)
            }
            else{
                npublicados.append(tutorial)
            }
        }
            
        
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
        
        if self.segmentAbas.selectedSegmentIndex == 0{
            return self.publicados.count
        }
        if self.segmentAbas.selectedSegmentIndex == 1{
            return self.npublicados.count
        }
        if self.segmentAbas.selectedSegmentIndex == 2{
            return self.pedidos.count
        }
        
        return tutoriais.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let linhaAtual = indexPath.row
        let linha = tableView.dequeueReusableCellWithIdentifier("cellMT") as! MTuTableViewCell
        
        
        if self.segmentAbas.selectedSegmentIndex == 0{
            
            let tutorial =  publicados[linhaAtual]
            
            linha.labelNomeTutorial.text = tutorial["nome_tutorial"]
            linha.labelPublicado.text = "Publicado"
            return linha
        }
        if self.segmentAbas.selectedSegmentIndex == 1{
            
            let tutorial =  npublicados[linhaAtual]
            
            linha.labelNomeTutorial.text = tutorial["nome_tutorial"]
            linha.labelPublicado.text = "Rascunho"
            return linha
        }
        if self.segmentAbas.selectedSegmentIndex == 2{
            
            let tutorial =  pedidos[linhaAtual]
            
            linha.labelNomeTutorial.text = tutorial["nome_tutorial"]
            linha.labelPublicado.text = "Pedido"
            return linha
        }
        
        return linha
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        
       
        
    }
    


}

