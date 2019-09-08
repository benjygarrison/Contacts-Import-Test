//
//  ViewController.swift
//  Contacts Import Test
//
//  Created by Benjamin Garrison on 9/7/19.
//  Copyright © 2019 Benji Garrison. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController,CNContactPickerDelegate{
    
    private let contactPicker = CNContactPickerViewController()
    
    var contactArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            let phoneNumberCount = contact.phoneNumbers.count
            
            guard phoneNumberCount > 0 else {
                dismiss(animated: true)
                //show pop up: "Selected contact does not have a number"
                return
            }
            
            if phoneNumberCount == 1 {
                setNumberFromContact(contactNumber: contact.phoneNumbers[0].value.stringValue)
                
            } else {
                let alertController = UIAlertController(title: "Select one of the numbers", message: nil, preferredStyle: .alert)
                
                for i in 0...phoneNumberCount-1 {
                    let phoneAction = UIAlertAction(title: contact.phoneNumbers[i].value.stringValue, style: .default, handler: {
                        alert -> Void in
                        self.setNumberFromContact(contactNumber: contact.phoneNumbers[i].value.stringValue)
                    })
                    alertController.addAction(phoneAction)
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {
                    alert -> Void in
                    
                })
                alertController.addAction(cancelAction)
                
                dismiss(animated: true)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        func setNumberFromContact(contactNumber: String) {
            
            //UPDATE YOUR NUMBER SELECTION LOGIC AND PERFORM ACTION WITH THE SELECTED NUMBER
            
            var contactNumber = contactNumber.replacingOccurrences(of: "-", with: "")
            contactNumber = contactNumber.replacingOccurrences(of: "(", with: "")
            contactNumber = contactNumber.replacingOccurrences(of: ")", with: "")
            //contactNumber = contactNumber.removeWhitespacesInBetween()
            guard contactNumber.count >= 10 else {
                dismiss(animated: true) {
                    //self.popUpMessageError(value: 10, message: "Selected contact does not have a valid number")
                }
                return
            }
            //textFieldNumber.text = String(contactNumber.suffix(10))
           contactArray.append(contactNumber)
            print(contactArray)
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            
        }
    
}
