//
//  SecondViewController.swift
//  contacts
//
//  Created by Macbook on 07.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var img: UIImageView!
    var contacts = [String]()
    @IBOutlet weak var tv: UITableViewCell!
    //var clicked: Bool = false
    var contactsNum = [String]()
    var images = [String]()
    var ind:Int?
    var lab1:String?
    var lab2:String?
    var image1:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: image1!)
        img.layer.masksToBounds = false
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
        lbl1.text = lab1
        lbl2.text = lab2
        
    }
    @IBAction func udali(_ sender: UIButton) {
        contactsNum.remove(at: ind!)
        contacts.remove(at: ind!)
        images.remove(at: ind!)
      
       
       self.navigationController?.popViewController(animated: true)
       // performSegue(withIdentifier: "delShow", sender: nil)
       
    }

    @IBAction func call(_ sender: UIButton) {
        let alert = UIAlertController(title: "Call", message: lab2, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: nil))
         alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MyTableViewController{
            dest.contacts = contacts
            dest.contactsNumber = contactsNum
            dest.images = images
            dest.tableView.reloadData()
    }
    

    }*/
 
 }
