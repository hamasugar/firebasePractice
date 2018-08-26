//
//  CreateViewController.swift
//  googleLogin1
//
//  Created by user on 2018/08/03.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class CreateViewController: UIViewController {

    let ref = Database.database().reference()
    
    
    @IBOutlet weak var field: UITextField!

    
    @IBAction func button1(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "goList", sender: nil)
            
            
        
    
    }
    
    

    
    
    
    @IBOutlet weak var button2: UIButton!
    
    
    @IBAction func button2(_ sender: Any) {
        let text1 = self.field.text
        
        
       
        self.ref.observeSingleEvent(of: .value, with:{ (snapshot) in
            
            
            let value:NSDictionary = snapshot.value as! NSDictionary
            let number2:Int = value["number"]! as! Int
            let number = number2.description
            
            self.ref.child(number).setValue(text1!)
            self.ref.child("number").setValue(number2+1)
            print ("-------------------------------------------")
            print (value)
           
            
        
        }
        
        )
        
            
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
