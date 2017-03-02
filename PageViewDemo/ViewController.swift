//
//  ViewController.swift
//  PageViewDemo
//
//  Created by Adarsh on 19/10/16.
//  Copyright © 2016 Adarsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageController : UIPageViewController!
    var pageContent = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createContentPages()
//        let options = [UIPageViewControllerOptionSpineLocationKey: UIPageViewControllerSpineLocation.min]
        pageController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.pageCurl, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        pageController.dataSource = self
        pageController.view.frame = self.view.bounds
        let initialVC = self.viewControllerAtIndex(index: 0)
        let viewControllers = [initialVC]
        pageController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParentViewController: self)
    }
    
    func createContentPages() {
        var array = [String]()
        for i in 0 ..< 11{
            let contentStr = "<html><head></head><body><br><h1>Page \(i) </h1><p> This is the number \(i) of our PageView Controller app example. </p></body></html>"
            array.append(contentStr)
            
        }
        
        pageContent = array
    }
    
    override func index(ofAccessibilityElement element: Any) -> Int {
        return pageContent.index(of: (element as! ContentViewController).dataObject)!
    }
    
    
    func viewControllerAtIndex(index : Int) -> ContentViewController{
        if(self.pageContent.count == 0 || (index >= self.pageContent.count)){
            return ContentViewController()
        }
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let controller : ContentViewController = storyBoard.instantiateViewController(withIdentifier: "contentView") as! ContentViewController
        controller.dataObject = pageContent[index]
        return controller
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.index(ofAccessibilityElement: viewController)
        if(index == NSNotFound){
            return nil
        }
        index += 1
        if(index == self.pageContent.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.index(ofAccessibilityElement: viewController)
        if(index == 0 || index == NSNotFound){
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
        
    }

}

