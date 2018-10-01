//
//  OnboardingController.swift
//  Luna
//
//  Created by MSi on 6/13/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController, UIScrollViewDelegate {
	let backgroundColor = UIColor(red: 71.0/255.0, green: 59.0/255.0, blue: 80.0/255.0, alpha: 1.0)
	
    let slides = [
		[ "image": "onboard_1.png", "textheading": "Meet Luna.", "text": "You may not know her, but she's your best buddy in the outer space."],
		[ "image": "onboard_2.png", "textheading": "Express yourself.", "text": "Share your stories, \n to the moon and back."],
		[ "image": "onboard_3.png", "textheading": "Listen to the whisper.", "text": "Listen and chat with Luna all over the space. You name them."],
	]
	
    let screen: CGRect = UIScreen.main.bounds
	var scroll: UIScrollView?
	var dots: UIPageControl?
    let button = UIButton(type: UIButtonType.system)
	
    override func viewDidLoad() {
		super.viewDidLoad()
//		view.backgroundColor = backgroundColor
        view.backgroundColor = UIColor(patternImage: UIImage(named: "onboard_bg.png")!)
        
		scroll = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screen.width, height: screen.height * 0.9))
		scroll?.showsHorizontalScrollIndicator = false
		scroll?.showsVerticalScrollIndicator = false
        scroll?.isPagingEnabled = true
		view.addSubview(scroll!)
		if (slides.count > 1) {
			dots = UIPageControl(frame: CGRect(x: 0.0, y: screen.height * 0.82, width: screen.width, height: screen.height * 0.05))
			dots?.numberOfPages = slides.count
			view.addSubview(dots!)
		}
        for var i = 0; i < slides.count; ++i {
            if let image = UIImage(named: slides[i]["image"]!) {
                var imageView: UIImageView = UIImageView(frame: getFrame(image.size.width, iH: image.size.height, slide: i, offset: screen.height * 0.15))
                imageView.image = image
                scroll?.addSubview(imageView)
            }
            if let textHeading = slides[i]["textheading"] {
                var textHeadingView = UITextView(frame: CGRect(x: screen.width * 0.1 + CGFloat(i) * screen.width, y: screen.height * 0.62, width: screen.width * 0.8, height: 100.0))
                textHeadingView.text = textHeading
                textHeadingView.editable = false
                textHeadingView.selectable = false
                textHeadingView.textAlignment = NSTextAlignment.Center
                textHeadingView.font = UIFont(name: "AvenirNext-Medium", size: 20)
                textHeadingView.textColor = UIColor.whiteColor()
                textHeadingView.backgroundColor = UIColor.clearColor()
                scroll?.addSubview(textHeadingView)
            }

            if let text = slides[i]["text"] {
                var textView = UITextView(frame: CGRect(x: screen.width * 0.1 + CGFloat(i) * screen.width, y: screen.height * 0.70, width: screen.width * 0.8, height: 100.0))
                textView.text = text
                textView.editable = false
                textView.selectable = false
                textView.textAlignment = NSTextAlignment.Center
                textView.font = UIFont(name: "AvenirNext-Regular", size: 15)
                textView.textColor = UIColor.whiteColor()
                textView.backgroundColor = UIColor.clearColor()

                scroll?.addSubview(textView)
            }
            button.frame = CGRectMake(0.0, screen.height * 0.88, screen.width, 50)
            button.backgroundColor = UIColor.clearColor()
            button.titleLabel?.textAlignment = NSTextAlignment.Center
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitle("Get Started", forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 19)
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)

            self.view.addSubview(button)
        }
        
		scroll?.contentSize = CGSize(CGFloat(Int(screen.width) *  slides.count), screen.height * 0.5)
		scroll?.delegate = self
        dots?.addTarget(self, action: Selector("swipe:"), for: UIControlEvents.valueChanged)
	}
    
    func buttonAction(sender: UIButton){
        self.performSegue(withIdentifier: "continueToCVC", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
    func getFrame (iW: CGFloat, iH: CGFloat, slide: Int, offset: CGFloat) -> CGRect {
        let mH: CGFloat = screen.height * 0.50
        let mW: CGFloat = screen.width
		var h: CGFloat
		var w: CGFloat
        let r = iW / iH
		if (r <= 1) {
			h = min(mH, iH)
			w = h * r
		} else {
			w = min(mW, iW)
			h = w / r
		}
		return CGRectMake(
			max(0, (mW - w) / 2) + CGFloat(slide) * screen.width,
			max(0, (mH - h) / 2) + offset,
			w,
			h
		)
	}
	
    func swipe(sender: AnyObject) -> () {
		if let scrollView = scroll {
			let x = CGFloat(dots!.currentPage) * scrollView.frame.size.width
            scroll?.setContentOffset(CGPoint(x: x, y: 0), animated: true)
		}
	}
	
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) -> () {
		let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
		dots!.currentPage = Int(pageNumber)
	}
}
