//
//  MemoViewController.swift
//  googleLogin1
//
//  Created by user on 2018/08/13.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    var x1:CGFloat = -1
    var y1:CGFloat = -1
    var x2:CGFloat = -1
    var y2:CGFloat = -1
    var zyoutai:Int = 0
    
    var blackButton:UIButton! = UIButton()
    var redButton:UIButton! = UIButton()
    var whiteButton:UIButton! = UIButton()
    var recButton:UIButton! = UIButton()
    var cirButton:UIButton! = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blackButton.backgroundColor = UIColor.black
        blackButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blackButton.addTarget(self, action: #selector(black), for: .touchUpInside)
        self.view.addSubview(blackButton)
        
        redButton.backgroundColor = UIColor.red
        redButton.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
        redButton.addTarget(self, action: #selector(red), for: .touchUpInside)
        self.view.addSubview(redButton)
        
        whiteButton.backgroundColor = UIColor.green
        whiteButton.frame = CGRect(x: 100, y: 0, width: 50, height: 50)
        whiteButton.addTarget(self, action: #selector(white), for: .touchUpInside)
        self.view.addSubview(whiteButton)
        
        
        recButton.backgroundColor = UIColor.yellow
        recButton.frame = CGRect(x: 150, y: 0, width: 50, height: 50)
        recButton.addTarget(self, action: #selector(rec), for: .touchUpInside)
        self.view.addSubview(recButton)
        
        
        cirButton.backgroundColor = UIColor.purple
        cirButton.frame = CGRect(x: 200, y: 0, width: 50, height: 50)
        cirButton.addTarget(self, action: #selector(cir), for: .touchUpInside)
        self.view.addSubview(cirButton)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    
    if zyoutai == 0{
    
        x1 = x2
        y1 = y2
        
        let aTouch = touches.first as! UITouch
        let location = aTouch.location(in: self.view)
        
        
        x2 = location.x
        y2 = location.y
        
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        path.lineWidth = CGFloat(5.0) // 線の太さ
        shapeLayer.lineWidth = 5.0
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.path = path.cgPath
        
        self.view.layer.addSublayer(shapeLayer)
        
    }
    
    
    if zyoutai == 1{
        
        x1 = x2
        y1 = y2
        
        let aTouch = touches.first as! UITouch
        let location = aTouch.location(in: self.view)
        
        
        x2 = location.x
        y2 = location.y
        
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        path.lineWidth = CGFloat(5.0) // 線の太さ
        shapeLayer.lineWidth = 5.0 //これは不要かもしれない
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.path = path.cgPath
        
        self.view.layer.addSublayer(shapeLayer)
        
    }
    
    
    if zyoutai == 2{
        
        x1 = x2
        y1 = y2
        
        let aTouch = touches.first as! UITouch
        let location = aTouch.location(in: self.view)
        
        
        x2 = location.x
        y2 = location.y
        
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        path.lineWidth = CGFloat(20.0) // 線の太さ
        shapeLayer.lineWidth = 20.0
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.path = path.cgPath
        
        self.view.layer.addSublayer(shapeLayer)
        
    }
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       let atouch = touches.first as! UITouch
        let location = atouch.location(in: self.view)
        
        x1 = location.x
        x2 = location.x
        y1 = location.y
        y2 = location.y
}
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if zyoutai == 3{
            
            let atouch = touches.first as! UITouch
            let location = atouch.location(in: self.view)
            
            x2 = location.x
            y2 = location.y
            
            let rectangle = UILabel()
            rectangle.backgroundColor = UIColor.red
            rectangle.frame = CGRect(x: x1, y: y1, width: x2-x1, height: y2-y1)
            self.view.addSubview(rectangle)
        }
        
        if zyoutai == 4{
            
            let atouch = touches.first as! UITouch
            let location = atouch.location(in: self.view)
            
            x2 = location.x
            y2 = location.y
            let circle = UILabel()
            circle.backgroundColor = UIColor.red
            circle.layer.masksToBounds = true
            circle.layer.cornerRadius = 10.0
            
            circle.frame = CGRect(x: x1, y: y1, width: x2-x1, height: y2-y1)
            self.view.addSubview(circle)
            
            
        }
        
        
        
    
        
        
}
    
@objc func red(){
        
        zyoutai = 1
    }
    
    @objc func black(){
        
        zyoutai = 0
    }
    
    @objc func white(){
        
        zyoutai = 2
    }
    
    @objc func rec(){
        
        zyoutai = 3
        
    }
    @objc func cir(){
        
        
        zyoutai = 4 //ここで楕円を作りたい
        
    }
    
    
}
