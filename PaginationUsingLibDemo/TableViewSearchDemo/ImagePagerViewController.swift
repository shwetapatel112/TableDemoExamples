//
//  ImagePagerViewController.swift
//  TableViewSearchDemo
//
//  Created by Administrator on 07/04/17.
//  Copyright © 2017 Zerones. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImagePagerViewController: UIViewController {

    @IBOutlet weak var slideShw: ImageSlideshow!
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //slideShw.slideshowInterval = 2
        
        
        slideShw.backgroundColor = UIColor.white
        //slideShw.slideshowInterval = 5.0
        
        slideShw.pageControlPosition = PageControlPosition.underScrollView
        slideShw.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideShw.pageControl.pageIndicatorTintColor = UIColor.black
        slideShw.contentScaleMode = UIViewContentMode.scaleAspectFill
        slideShw.currentPageChanged = { page in
            print("current page:", page)
        }
        
        slideShw.setImageInputs([
            ImageSource(image: UIImage(named: "myImage1")!),
            ImageSource(image: UIImage(named: "myImage2")!),
            ImageSource(image: UIImage(named: "myImage3")!),
            ImageSource(image: UIImage(named: "myImage4")!),
            ])
        
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ImagePagerViewController.didTap))
//        slideShw.addGestureRecognizer(recognizer)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
    }

    func respondToSwipeGesture(){
        print("swipe recognised")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
