//
//  SignUpViewController.swift
//  In The Mood
//
//  Created by Tijn Coertjens on 07/04/2020.
//  Copyright © 2020 Biertjens. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase


class SignUpViewController: UIViewController {



    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        
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
    
    func showFirstOpenViewController() {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let FirstOpenViewController = storyboard.instantiateViewController(identifier: "FirstOpenViewController")

        show(FirstOpenViewController, sender: self)
      }
    
    @IBAction func emailSignUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailAddressField.text!, password: passwordField.text!){ (user, error) in
        if error == nil {
            self.showFirstOpenViewController()
            
            print(user)
        }
        else{
            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
    
    @IBAction func googleSignUpButton(_ sender: Any) {
         GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
      //Sign in functionality will be handled here
          if let error = error {
            
          print(error.localizedDescription)
          
          return
          }
          guard let auth = user.authentication else { return }
          let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
          Auth.auth().signIn(with: credentials) { (authResult, error) in
          if let error = error {
          print(error.localizedDescription)
          } else {
              print("Login Successful.")
          //This is where you should add the functionality of successful login
          //i.e. dismissing this view or push the home view controller etc
              
          }
      }
      
    
}
}
