//
//  SignInVC.swift
//  DevChat
//
//  Created by Dustin Hullett on 10/29/16.
//  Copyright © 2016 Dustin Hullett. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func FaceBookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("DUSTIN: Unable to authenticate with FB - \(error)")
            } else if result?.isCancelled == true {
                print("DUSTIN: User cancled FB authentication")
            } else {
                print("DUSTIN: Authentication Success")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("DUSTIN: Unable to authenticate with firebase \(error)")
            } else {
                print("DUSTIN: Firebase is Authenticated")
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let password = pwField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("DUSTIN: Sign in successful with email in firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("DUSTIN: Email Auth Failed \(error)")
                        } else {
                            print("DUSTIN: CREATED USER WITH EMAIL")
                        }
                    })
                }
            })
        }
        
    }
    
    
}
