//
//  FirstViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableHome: UITableView!
    
    var alert: String?
    var searchActive : Bool = false
    var tutoriais = [[String: String]]()
    var filtered = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tutoriais = Tutoriais.listarTutoriais()
        
        self.tableHome.dataSource = self
        self.tableHome.delegate = self
        self.searchBar.delegate = self
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if alert != nil {
            self.showAlert("Parabéns", message: "O seu tutorial foi pedido para um especialista")
            alert = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ---------- Search Methods ----------
    
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
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filtered = self.tutoriais.filter({ (tutorial) -> Bool in
            let tmp: NSString = tutorial["nome_tutorial"]!
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })

        if(filtered.count == 0){
            self.searchActive = false;
        } else {
            self.searchActive = true;
        }
        
        self.tableHome.reloadData()
    }
    
    
    // ---------- Table Methods ----------

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.searchActive) {
            return self.filtered.count
        }
        return self.tutoriais.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let linhaAtualTabela = indexPath.row
        let linha = tableView.dequeueReusableCellWithIdentifier("cellTutoriaisHome") as! HomeTableViewCell
        
        let tutorial = self.searchActive ? self.filtered[linhaAtualTabela] : self.tutoriais[linhaAtualTabela]
        
        linha.labelNomeTutorial.text = tutorial["nome_tutorial"]
        linha.labelNome.text = tutorial["nome_autor"]
        linha.labelVistoPor.text = tutorial["visto"]
        linha.labelCurtidoPor.text = tutorial["likes"]
        
        return linha
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "homeToTutoriaisView" {
            let linhaAtualTabela = self.tableHome.indexPathForCell(sender as! UITableViewCell)!.row
            if let visualizacaoTutoriaisView = segue.destinationViewController as? VisualizacaoTutoriaisView {
                visualizacaoTutoriaisView.tutorial = self.tutoriais[linhaAtualTabela]
            }
        }
        
        if segue.identifier == "pedirTutoriais" {
            if let pedirTutoriaisView = segue.destinationViewController as? PedirTutorialView {
                pedirTutoriaisView.parentView = self
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

