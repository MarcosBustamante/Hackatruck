//
//  FirstViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableHome: UITableView!
    
    var tutoriais = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mockData()
        
        self.tableHome.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutoriais.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let linhaAtualTabela = indexPath.row
        let linha = tableView.dequeueReusableCellWithIdentifier("cellTutoriaisHome") as! HomeTableViewCell
        
        linha.labelNomeTutorial.text = self.tutoriais[linhaAtualTabela]["nome_tutorial"]
        linha.labelNome.text = self.tutoriais[linhaAtualTabela]["nome_autor"]
        
        return linha
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let linhaAtualTabela = self.tableHome.indexPathForCell(sender as! UITableViewCell)!.row
        
        if segue.identifier == "homeToTutoriaisView" {
            if let visualizacaoTutoriaisView = segue.destinationViewController as? VisualizacaoTutoriaisView {
                visualizacaoTutoriaisView.tutorial = self.tutoriais[linhaAtualTabela]
            }
        }
    }
    
    func mockData(){
        for i in 1...20 {
            tutoriais.append([
                "nome_autor": "Autor \(i)",
                "desc_tutorial": "Desc \(i)",
                "nome_tutorial": "Tutorial \(i)",
                ])
        }
    }

}

