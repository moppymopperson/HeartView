//
//  HeartWeekViewController.swift
//  HeartView
//
//  Created by Erik Hornberger on 2017/01/27.
//  Copyright © 2017年 EExT. All rights reserved.
//

import Foundation
import UIKit

class HeartWeekViewController: UIViewController {
    
    
    @IBOutlet weak var sundayHeart: HeartView!
    @IBOutlet weak var mondayHeart: HeartView!
    @IBOutlet weak var tuesdayHeart: HeartView!
    @IBOutlet weak var wednesdayHeart: HeartView!
    @IBOutlet weak var thursdayHeart: HeartView!
    @IBOutlet weak var fridayHeart: HeartView!
    @IBOutlet weak var saturdayHeart: HeartView!
    
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
  
    
    var heartViews:[HeartView] {
        return [
            sundayHeart,
            mondayHeart,
            tuesdayHeart,
            wednesdayHeart,
            thursdayHeart,
            fridayHeart
        ]
    }
    
    var weekdayLabels:[UILabel] {
        return [
            sundayLabel,
            mondayLabel,
            tuesdayLabel,
            wednesdayLabel,
            thursdayLabel,
            fridayLabel,
            saturdayLabel
        ]
    }
    
    
}
