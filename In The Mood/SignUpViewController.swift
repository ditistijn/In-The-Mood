//
//  SignUpViewController.swift
//  In The Mood
//
//  Created by Tijn Coertjens on 07/04/2020.
//  Copyright © 2020 Biertjens. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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

    @IBAction func backButton(_ sender: Any) {
        dismiss (animated: true, completion: nil)  
    }
    
    @IBAction func emailSignUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailAddressField.text!, password: passwordField.text!){ (user, error) in
        if error == nil {
            self.performSegue(withIdentifier: "signupToFirstView", sender: self)
        }
        else{
            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }

    }
}

}
