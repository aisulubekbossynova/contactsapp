//
//  MyTableViewController.swift
//  contacts
//
//  Created by Macbook on 06.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
class MyCell: UITableViewCell {
    @IBOutlet weak var contName: UILabel!
     @IBOutlet weak var contPhone: UILabel!
    @IBOutlet weak var contImageView: UIImageView!
  
    
    
}
class MyTableViewController: UITableViewController {
    var contacts = ["Aisulu Bekbossynova", "Gulzhanat Mukanova", "Aigerim Suleimenova", "Aydyn Orazbekov"]
    var contactsNumber = ["87784395039", "87051500985", "87471324503", "87773219854"]
    var images = ["Female.png", "Female.png", "Female.png", "Male.png"]
    var lbl1:String?
    var lbl2:String?
    var img:String?
    var imgName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if contacts.count == 0 && contactsNumber.count == 0 && images.count == 0 {
            /*let label = UILabel(frame: CGRect(0, 0, 200, 21))
            label.center = CGPoint(160, 284)
            label.textAlignment = NSTextAlignment.center
            label.text = "I'am a test label"
            self.view.addSubview(label)*/
            tableView.backgroundColor =  UIColor.black
            
        }
        if contacts.count == 0 {
            tableView.backgroundColor =  UIColor.black
            let alert = UIAlertController(title: "", message: "No Contacts", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        self.tableView.separatorStyle = .none
       self.tableView.allowsMultipleSelectionDuringEditing = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return contacts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LblCell", for: indexPath)  as! MyCell
      
        let contactName = contacts[indexPath.row]
        let contactNumber = contactsNumber[indexPath.row]
        cell.contName?.text = contactName
        cell.contPhone?.text = contactNumber
        let oo = images[indexPath.row]
        cell.contImageView?.image = UIImage(named: oo)
    
        cell.contImageView.layer.masksToBounds = false
        cell.contImageView.layer.cornerRadius = cell.contImageView.frame.size.width / 2;
        cell.contImageView?.clipsToBounds = true
        
        lbl1 = contacts[indexPath.row]
        lbl2 = contactsNumber[indexPath.row]
       
        return cell
    }
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let destination = segue.destination as? SecondViewController{
            destination.lab1 = contacts[(tableView.indexPathForSelectedRow?.row)!]
            destination.lab2 = contactsNumber[(tableView.indexPathForSelectedRow?.row)!]
            destination.image1 = images[(tableView.indexPathForSelectedRow?.row)!]
            destination.contacts = contacts
            destination.contactsNum = contactsNumber
            destination.images = images
            destination.ind = tableView.indexPathForSelectedRow?.row
            
            }
        
        if let dest = segue.destination as? AddScreenViewController{
            dest.contacts = contacts
            dest.contactsNum = contactsNumber
            dest.images = images
        }
       
    }
  

    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
    
   
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        self.contactsNumber.remove(at: indexPath.row)
        self.contacts.remove(at: indexPath.row)
        self.images.remove(at: indexPath.row)
        if contacts.count == 0 {
            self.tableView.backgroundColor =  UIColor.black
            let alert = UIAlertController(title: "", message: "No Contacts", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
}
}
