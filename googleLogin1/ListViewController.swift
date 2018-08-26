//
//  ListViewController.swift
//  googleLogin1
//
//  Created by user on 2018/08/08.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    @IBOutlet weak var table: UITableView!
    let ref = Database.database().reference()
    var Items1:[String] = []
    var number2:Int = 12
    
    
    
    @IBOutlet weak var field2: UITextField!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
    
    table.dequeueReusableCell(withIdentifier: "cell")
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    

    self.ref.observe(.value, with:{ (snapshot) in
        
        
        if let postDict = snapshot.value as? NSDictionary {
            
            self.Items1 = [String]()
            let number = postDict["number"] as! Int
            print ("ssssssssss")
            var j = 0
            while j<number {
                let k = j.description
             
                if let jj = postDict[k]{
                self.Items1.append(jj as! String)
                
                    
                }
                j+=1
            }
            
           
        }
        
        
        self.table.reloadData()
        
        
    }
    )
    

    
    // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    @IBAction func button3(_ sender: Any) {
        
        
        let text2 = self.field2.text
        
        
        
        self.ref.observeSingleEvent(of: .value, with:{ (snapshot) in
            
            
           
            self.ref.child("1").setValue(text2!)
            
            
            
            self.table.reloadData()
            
            
            
        }
            
        )
        
        
        
        
        
        
        
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        
        performSegue(withIdentifier: "back", sender: nil)
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        print (self.Items1.count)
        print ("count")
    return  self.Items1.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell = self.table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
    
        cell.textLabel?.text = self.Items1[indexPath.row]
        
        print (self.Items1[indexPath.row])
        print ("row")
        print (self.Items1[indexPath.row])
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       

       self.ref.observeSingleEvent(of:.value, with:{ (snapshot) in
        
        
     if let postDict = snapshot.value as? NSDictionary {
        self.Items1 = [String]()
        let number = postDict["number"] as! Int
        print ("ssssssssss")
        var j = 0
        var array = [Int]()
        
        while j<number {
            let k = j.description
            
            if let jj = postDict[k]{
                self.Items1.append(jj as! String)
                array.append(j)
            }
            j+=1
        }
        
    self.ref.child(array[indexPath.row].description).removeValue()
            
            
         }
       }
        )
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
