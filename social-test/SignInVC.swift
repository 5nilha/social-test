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
import SwiftKeychainWrapper



class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("Developer: ID found in Keychain")
            performSegue(withIdentifier: "goToHome", sender: nil)
        }
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
                print("Developer: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Developer: User cancelled Facebook authentication")
            } else {
                print("Developer: Successfully authenticated with Facebook")
                 let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
            
        }
    }
    
    
    //Firebase code
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
            print("Developer: Unable to authenticate with Firebase - \(error)")
            } else {
            print("Developer: Successfully authenticated with Firebase")
                if let user = user {
                   self.completeSigIn(id: user.uid)
                    
                }
            }
        
        } )
    }
    
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                print("Developer: Email user successfully authenticated with Firebase")
                if let user = user {
                    self.completeSigIn(id: user.uid)
                    
                }

            } else {
                
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    
                    if error != nil {
                        print("Developer: Unable to authenticate with Firebase using email")
                    } else {
                        print("Developer: Successfully authenticated with Firebase")
                        if let user = user {
                            self.completeSigIn(id: user.uid)
                            
                        }

                    }
                    
                })
            }

        })
        
    }
    
    func completeSigIn(id: String){
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Developer: Data saved to keychain \(keychainResult)" )
        performSegue(withIdentifier: "goToHome", sender: nil)
    }
    
}
