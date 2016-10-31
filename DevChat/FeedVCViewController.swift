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


class FeedVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signOutPressed(_ sender: Any) {
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
