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
    
    let dateRange:DateInterval
    
    init(startDate:Date) {
        let firstDayComponents = Calendar.current.dateComponents(Set([.year, .month, .day]), from: startDate)
        let firstDate = Calendar.current.date(from: firstDayComponents)!
        let lastDate = Calendar.current.date(byAdding: .day, value: 6, to: firstDate)!
        self.dateRange = DateInterval(start: firstDate, end: lastDate)
        
        super.init(nibName: "HeartWeekViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            fridayHeart,
            saturdayHeart
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
    
 
    // TODO: Fill each heart based on data
    func randomizeFills() {
        heartViews.forEach { $0.value = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        randomizeFills()
    }
}
