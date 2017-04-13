//
//  ViewController.swift
//  MyCalcHsuanLin
//
//  Created by Hsuan Lin on 3/30/17.
//  Copyright © 2017 Hsuan Lin. All rights reserved.
//

import UIKit

enum modes{
    case not_set
    case addition
    case subtraction
    case multiplication
}

class ViewController: UIViewController {

    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    
    
    // comment
    
    @IBOutlet weak var CalcLabel: UILabel!
    
    
    @IBAction func PressedNumber(_ sender: UIButton) {
        
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        
        let stringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(stringValue!)
        
        updateText()
        
    }
    
    
    @IBAction func PressedPlus(_ sender: UIButton) {
        changeMode(newMode: .addition)
    }
    
    @IBAction func PressedSubtract(_ sender: UIButton) {
        changeMode(newMode: .subtraction)
    }
    
    
    @IBAction func PressedMultiply(_ sender: UIButton) {
        changeMode(newMode: .multiplication)
    }
    
    

    
    
    @IBAction func PressedClear(_ sender: UIButton) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        
        updateText()
    }
    
    
    @IBAction func PressedEquals(_ sender: UIButton) {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        if (currentMode == .not_set || lastButtonWasMode) {
            return
        }
        if (currentMode == .addition) {
            savedNum += labelInt
        }
        else if(currentMode == .subtraction) {
            savedNum -= labelInt
        }
        else if(currentMode == .multiplication) {
            savedNum *= labelInt
        }

        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func changeMode(newMode:modes){
        //calling this sending a "mode", put into "newMode"
        if(savedNum == 0){
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
        
       
    }
    
    func updateText(){
        
        guard let labelInt:Int = Int(labelString) else{
            return // leave "update text" b/c labelString has not value.
        }
        if(currentMode == .not_set){
            savedNum = labelInt
        }
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value: labelInt)
        CalcLabel.text = formatter.string(from: num)
        
        //CalcLabel.text = "\(labelInt)"
        
        
    }
    
}















