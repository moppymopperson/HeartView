//
//  HeartWeekPageViewController.swift
//  HeartView
//
//  Created by Erik Hornberger on 2017/01/27.
//  Copyright © 2017年 EExT. All rights reserved.
//

import Foundation
import UIKit

class HeartWeekPageViewController: UIPageViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate   = self
        dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setViewControllers([ HeartWeekViewController(startDate: Date()) ],
                           direction: .forward,
                           animated: false,
                           completion: nil)
    }
    

}

extension HeartWeekPageViewController: UIPageViewControllerDataSource {
    
    func page(for date: Date) -> HeartWeekViewController {
        let weekController = HeartWeekViewController(startDate: date)
        return weekController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let heartWeekController = viewController as? HeartWeekViewController {
            let nextDate = Calendar.current.date(byAdding: .day, value: 7, to: heartWeekController.dateRange.start)!
            return page(for: nextDate)
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let heartWeekController = viewController as? HeartWeekViewController {
            let previousDate = Calendar.current.date(byAdding: .day, value: -7, to: heartWeekController.dateRange.start)!
            return page(for: previousDate)
        } else {
            return nil
        }
    }
}

extension HeartWeekPageViewController: UIPageViewControllerDelegate {
    
}
