//
//  AddScreenViewController.swift
//  contacts
//
//  Created by Macbook on 07.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    let detailViewController = MyTableViewController()
    var contacts = [String]()
    var contactsNum = [String]()
    var images = [String]()
    var name:String?
    var tel:String?
    var gender:String?
    var pickerData = ["Male", "Female"]
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var edit1: UITextField!
    @IBOutlet weak var edit2: UITextField!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let ValueSelected = pickerData[row] as String
        gender = ValueSelected
    }

   
    @IBAction func save(_ sender: UIButton){
        name = edit1.text
        tel = edit2.text
        contacts.append(name!)
        contactsNum.append(tel!)
        gender = pickerData[picker.selectedRow(inComponent: 0)]
        images.append(gender!+".png")
       
       // detailViewController.contacts.append(name!)
      //  detailViewController.contactsNumber.append(tel!)
      //  detailViewController.images.append(gender!+".png")
     //   DispatchQueue.main.async{
    //        self.detailViewController.tableView.reloadData()
    //    }
    //    detailViewController.tableView.reloadData()
     //   print(detailViewController.contacts)
     //   print(detailViewController.contactsNumber)
      //  print(detailViewController.images)
        
        performSegue(withIdentifier: "saveShow", sender: nil)
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MyTableViewController{
            dest.contacts = contacts
            dest.contactsNumber = contactsNum
            dest.images = images
         //   dest.tableView.reloadData()
            print(dest.contacts)
            print(dest.contactsNumber)
            print(dest.images)
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
