//
//  ViewController.swift
//  social-test
//
//  Created by Fabio Quintanilha on 12/2/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Facebook code
    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("####: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("####: User cancelled Facebook authentication")
            } else {
                print("####: Successfully authenticated with Facebook")
                 let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
            
        }
    }
    
    
    //Firebase code
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
            print("####: Unable to authenticate with Firebase - \(error)")
            } else {
            print("####: Successfully authenticated with Firebase")
            }
        
        } )
    }

}

