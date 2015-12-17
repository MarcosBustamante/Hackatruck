//
//  NotTableViewController.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class NotTableViewController: UITableViewController {

    @IBOutlet var tableNot: UITableView!
    
    var notificacoes = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableNot.dataSource = self
        self.notificacoes = Notificacao.listar_notificacoe("sergio")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.notificacoes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let linhaAtualTabela = indexPath.row
        let cell = tableView.dequeueReusableCellWithIdentifier("notReusable", forIndexPath: indexPath) as! NotTableViewCell

        let notificacao = self.notificacoes[linhaAtualTabela]
        
        cell.labelAutor.text = notificacao["user_id"]
        cell.labelNomeTutorial.text = notificacao["titulo"]
        cell.labelPublicado.text = notificacao["pedido"] == "true" ? "Pedido" : "Recebido"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
