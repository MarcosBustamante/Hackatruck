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
    var pub = false
    
    var publicados = [[String: String]]()
    var npublicados = [[String: String]]()
    var pedidos = [[String: String]]()
    
    var data = [[[String: String]]]()
    let titulos = ["Publicado", "Rascunho", "Pedido"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tutoriais = Tutoriais.listarTutoriais()
        for var tutorial in self.tutoriais{
            if tutorial["publicado"] == "true"{
                self.publicados.append(tutorial)
            }
            else{
                npublicados.append(tutorial)
            }
        }
        
        self.data = [self.publicados, self.npublicados, self.tutoriais]
        
        self.tableMT.dataSource = self
        self.tableMT.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.data[self.segmentAbas.selectedSegmentIndex].count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let linhaAtual = indexPath.row
        let linha = tableView.dequeueReusableCellWithIdentifier("cellMT") as! MTuTableViewCell
        
        let data = self.data[self.segmentAbas.selectedSegmentIndex][linhaAtual]
        linha.labelNomeTutorial.text = data["nome_tutorial"]
        linha.labelPublicado.text = self.titulos[self.segmentAbas.selectedSegmentIndex]
        
        return linha
        
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        self.tableMT.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "segueMT" {
            let linhaAtualTabela = self.tableMT.indexPathForCell(sender as! UITableViewCell)!.row
            if let visualizacaoTutoriaisView = segue.destinationViewController as? VisualizacaoTutoriaisView {
                visualizacaoTutoriaisView.tutorial = self.data[self.segmentAbas.selectedSegmentIndex][linhaAtualTabela]

                }
                
            
            
        }
        
    }
    


}

