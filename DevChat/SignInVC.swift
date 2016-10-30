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
}
