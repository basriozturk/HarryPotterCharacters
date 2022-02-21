//
//  StoryboardHelper.swift
//  YinzCamScheduleExercise
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import UIKit


enum StoryboardHelper : String {
    
    case Main
    
    var instance : UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(identifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromStoryboard storyboardHelper: StoryboardHelper) -> Self {
        return storyboardHelper.viewController(viewControllerClass: self)
    }
    
}
