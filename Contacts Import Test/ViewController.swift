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

    

//add function below to existing code in main PASSWORD project (import from other project)
    
        //MARK:- contact picker
        func onClickPickContact(){
            
            
            let contactPicker = CNContactPickerViewController()
            contactPicker.delegate = self
            contactPicker.displayedPropertyKeys =
                [CNContactGivenNameKey
                    , CNContactPhoneNumbersKey]
            self.present(contactPicker, animated: true, completion: nil)
            
        }
        
        func contactPicker(_ picker: CNContactPickerViewController,
                           didSelect contactProperty: CNContactProperty) {
            
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            // You can fetch selected name and number in the following way
            
            // user name
            let userName:String = contact.givenName
            
            // user phone number
            let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
            let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value
            
            
            // user phone number string
            let primaryPhoneNumberStr:String = firstPhoneNumber.stringValue
            
            print(primaryPhoneNumberStr)
            
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            
        }
    }

