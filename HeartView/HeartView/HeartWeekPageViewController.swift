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
    
    
}

extension HeartWeekPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

extension HeartWeekPageViewController: UIPageViewControllerDelegate {
    
}
