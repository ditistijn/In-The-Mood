//
//  FirstOpenViewController.swift
//  In The Mood
//
//  Created by Tijn Coertjens on 14/04/2020.
//  Copyright © 2020 Biertjens. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirstOpenViewController: UIViewController {

    func showHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeViewController = storyboard.instantiateViewController(identifier: "HomeViewController")

      show(HomeViewController, sender: self)
    }
    
    
    func checkIfFirstOpen() {
        
        db.collection("users").document(userID).getDocument { (document, error) in
        if error == nil {
            
            if document != nil && document!.exists {
                let result = document!.get("registered")
                print(result!)
                
                if result != nil {
                    self.showHomeViewController()
                }
            }
        }
    }
}
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        checkIfFirstOpen()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        view.endEditing(true) //hide keyboard on touch
    }
    
   let userID = Auth.auth().currentUser!.uid
    
    func registeredToYes() {
        
        let db = Firestore.firestore()
         let newDocument = db.collection("users").document(userID)
         /*db.collection("users").addDocument(data: ["firstname": firstNameField!.text,
                                                   "lastname": lastNameField!.text,
                                                   "uid": userID])
        */
        newDocument.setData(["registered": "true"])
        
    }
    
    func storeNameData() {
        
        print(firstNameField.text, lastNameField.text)
       
        let db = Firestore.firestore()
        let newDocument = db.collection("users").document(userID)
        /*db.collection("users").addDocument(data: ["firstname": firstNameField!.text,
                                                  "lastname": lastNameField!.text,
                                                  "uid": userID])
       */
        
        
        newDocument.setData(["firstname": firstNameField!.text,
        "lastname": lastNameField!.text,
        "uid": userID])
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let AddFriendsViewController = storyboard.instantiateViewController(identifier: "AddFriendsViewController")

        show(AddFriendsViewController, sender: self)
    }
    
    @IBAction func getStarted(_ sender: Any) {
        
        if firstNameField!.text == "" || lastNameField!.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please fill in your information.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
        } else {
            
            storeNameData()
            registeredToYes()
            
        }
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
