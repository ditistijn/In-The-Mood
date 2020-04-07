//
//  SignUpViewController.swift
//  In The Mood
//
//  Created by Tijn Coertjens on 07/04/2020.
//  Copyright © 2020 Biertjens. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    
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
    
}
