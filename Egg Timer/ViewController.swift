//
//  ViewController.swift
//  Egg Timer
//
//  Created by Abdallah Eid on 9/27/17.
//  Copyright © 2017 TripleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    
    var timer : Timer!
    
    var cnt = 210
    
    var flip = true

    // layout connection
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func pauseButton(_ sender: Any) {
        
        timer.invalidate()
        
        flip = false
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if !flip {
            
            runTimer()
            
        }
        
        flip = true
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        cnt = 210
      
    }
    
    @IBAction func plus10Button(_ sender: Any) {
        
        cnt += 10
        
    }
    
    @IBAction func minus10Button(_ sender: Any) {
        
        if cnt < 10 {
            
            cnt = 0
            
        }else {
            
            cnt -= 10
            
        }
        
    }
    
    // functions
    
    func processingTimer(){
        
        if cnt < 0 {
            
            timer.invalidate()
            
            flip = false
            
        }
        else {
        
            timerLabel.text = "\(cnt)"
        
            cnt -= 1
        }
        
    }
    
    func runTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processingTimer), userInfo: nil, repeats: true)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        runTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

