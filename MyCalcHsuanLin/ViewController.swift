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
}

class ViewController: UIViewController {

    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    
    @IBOutlet weak var CalcLabel: UILabel!
    
    
    @IBAction func PressedNumber(_ sender: UIButton) {
    }
    
    
    @IBAction func PressedPlus(_ sender: UIButton) {
    }
    
    
    @IBAction func PressedClear(_ sender: UIButton) {
    }
    
    
    @IBAction func PressedEquals(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateText(){
    }
    
    func changeMode(newMode:modes){
    }

}

