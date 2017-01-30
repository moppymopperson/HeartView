//
//  ViewController.swift
//  HeartView
//
//  Created by Erik Hornberger on 2017/01/23.
//  Copyright © 2017年 EExT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heartView: HeartView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderSlid(_ sender: UISlider) {
        heartView.value  = CGFloat(sender.value)
    }

}

