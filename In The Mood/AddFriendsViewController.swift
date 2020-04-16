//
//  AddFriendsViewController.swift
//  In The Mood
//
//  Created by Tijn Coertjens on 14/04/2020.
//  Copyright © 2020 Biertjens. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase


let db = Firestore.firestore()
let userID = Auth.auth().currentUser!.uid

class AddFriendsViewController: UIViewController {
    @IBOutlet weak var addFriendsLabel: UILabel!
    func labelTextToFirstName() {
        /* db.collection("users").document("firstname") { (querySnapshot, err) in
            if err != nil {
                self.addFriendsLabel.text = "Let's add some friends!"
            } else {
                
                for firstname in querySnapshot!.documents {
                    print(firstname.data())
                    self.addFriendsLabel.text = "Let's add some friends, \(firstname)!"
                }
                
            }*/
   
       /* let docRef = db.collection("users").document()

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }*/
        /*db.collection("users").document(userID).getDocument { (document, error) in
            if error == nil {
                
                if document != nil && document!.exists {
                    let documentData = document!.data()
                    print(documentData)
                }
                
            }
        }*/
        
        db.collection("users").document(userID).getDocument { (document, error) in
            if error == nil {
                
                if document != nil && document!.exists {
                    let documentData = document!.get("firstname")
                    print(documentData!)
                    
                    
                    
                    self.addFriendsLabel.text = "Let's add some friends, \(documentData!)!"
                    
                    
                    
                    
                }
                
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        labelTextToFirstName()
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
