//
//  FeedVCViewController.swift
//  DevChat
//
//  Created by Dustin Hullett on 10/30/16.
//  Copyright © 2016 Dustin Hullett. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase
import SwiftKeychainWrapper


class FeedVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }

    
    @IBAction func signOut(_ sender: UITapGestureRecognizer) {
        do {
            try FIRAuth.auth()?.signOut()
            print("DUSTIN: Successfully Signed Out of Firebase")
        } catch {
            let err = error
            print(err)
        }
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    

}
