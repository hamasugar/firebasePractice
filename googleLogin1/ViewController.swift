//
//  ViewController.swift
//  googleLogin1
//
//  Created by user on 2018/07/19.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let button = GIDSignInButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(button)
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    
        if let aa = error{
            print ("errordesu")
            
            return
        }
        
        print ("era-nasi")
        
        guard let idToken = user.authentication.idToken else{
            
            return
        }
        
        guard let accessToken = user.authentication.accessToken else{
            
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        Auth.auth().signIn(with: credential, completion: {  (user, error) in
            
            if let err = error{
                
                print (err)
                return
            }
            
            print ("seikou")
            
            
            self.performSegue(withIdentifier: "next", sender: nil)
            
            
            })
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

