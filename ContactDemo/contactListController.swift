//
//  contactListController.swift
//  ContactDemo
//
//  Created by iFlame on 5/27/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
struct Contact {
    var title: String
    var text: String
    var mail: String
    var image: UIImage
}

class contactListController: UITableViewController {
    
    
    private var contacts = Array<Contact>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "bgimage"))
        
    }
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        print("Segue unwond")
        let source = segue.source as! AddViewContrller
        let name = source.contactName.text
        let number = source.contactNumber.text
        let email = source.contactEmail.text
        let profilePhoto = source.profilePicture.image
        print("Name: \(name!) Number: \(number!) Email: \(email)")
        
        let newItem:Contact? = Contact(title: name!, text: number!, mail: email!, image: profilePhoto! )
        self.contacts.append(newItem!)
        
        print("currently\(self.contacts.count) indexes")
        
        self.contacts = contacts.sorted {
            $0.title < $1.title
        }
        self.tableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contacts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactItem", for: indexPath) as! MyTableViewCell
        
        
        // Configure the cell...
        let contact:Contact = self.contacts[indexPath.row]
        cell.name.text = contact.title
        cell.number?.text = contact.text
        cell.mail.text = contact.mail
        cell.photo.image = contact.image
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        NSLog("row %i" , indexPath.row)
        self.tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier:"contactItem" , for: indexPath) as! MyTableViewCell
        let contact:Contact = self.contacts[indexPath.row]
        
        
        cell.name.text = contact.title
        cell.number?.text = contact.text
        cell.mail.text = contact.mail
        cell.photo.image = contact.image
        
        
        
        let alert = UIAlertController(title: "Name: \(contact.title)", message: "Number: \(contact.text) Mail ID: \(contact.mail)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction) in    print("Contact Detail Was Pressed")
        }))
        self.present(alert, animated: true, completion: nil)
        let table:UITableView = self.tableView
        
        
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contacts.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            NSLog("Row %i deleted", indexPath.row)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
