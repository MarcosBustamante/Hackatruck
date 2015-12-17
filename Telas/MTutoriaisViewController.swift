//
//  SecondViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class MTutoriaisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBarMT: UISearchBar!
    @IBOutlet weak var segmentAbas: UISegmentedControl!
    @IBOutlet weak var tableMT: UITableView!
    
    var searchText: String?
    var tutoriais = [[String: String]]()
    var pub = false
    var searchActive : Bool = false
    var publicados = [[String: String]]()
    var npublicados = [[String: String]]()
    var pedidos = [[String: String]]()
    var filtered = [[String: String]]()
    
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
        self.searchBarMT.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchActive = false;
    }
    
    func filter_data() -> [[String: String]] {
        if self.searchText == nil{
            self.searchText = ""
        }
        return self.data[self.segmentAbas.selectedSegmentIndex].filter({ (datas) -> Bool in
            let tmp: NSString = datas["nome_tutorial"]!
            let range = tmp.rangeOfString(self.searchText!, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchText = searchText
        
        self.filtered = filter_data()
        
        if(filtered.count == 0){
            self.searchActive = false;
        } else {
            self.searchActive = true;
        }
        
        self.tableMT.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(self.searchActive) {
            self.filtered = filter_data()
            return self.filtered.count
        }
        return self.data[self.segmentAbas.selectedSegmentIndex].count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let linhaAtual = indexPath.row
        let linha = tableView.dequeueReusableCellWithIdentifier("cellMT") as! MTuTableViewCell
        let data = self.searchActive ? self.filtered[linhaAtual]: self.data[self.segmentAbas.selectedSegmentIndex][linhaAtual]
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
                if segmentAbas.selectedSegmentIndex == 0 {
                    visualizacaoTutoriaisView.pub = true
                    visualizacaoTutoriaisView.pedido = false
                    visualizacaoTutoriaisView.rascunho = false
                }
                if segmentAbas.selectedSegmentIndex == 1 {
                    visualizacaoTutoriaisView.pub = false
                    visualizacaoTutoriaisView.pedido = false
                    visualizacaoTutoriaisView.rascunho = true
                }
                if segmentAbas.selectedSegmentIndex == 2 {
                    visualizacaoTutoriaisView.pub = false
                    visualizacaoTutoriaisView.pedido = true
                    visualizacaoTutoriaisView.rascunho = false
                }
                
            }
        }
        
    
    }
    


}

