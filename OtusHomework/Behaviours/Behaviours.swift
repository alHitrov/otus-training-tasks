//
//  Behaviours.swift
//  OTUSHomework
//
//  Created by Alexey on 14/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class PrintDateBehavior: ViewControllerLifecycleBehavior {
	
	weak var timer : Timer?
		
	func beforeAppearing(_ viewController: UIViewController) {
		if (timer == nil) {
			
			timer = Timer.scheduledTimer(timeInterval: 1.0,
			target: self,
			selector: #selector(runTimed),
			userInfo: nil,
			repeats: true)
		}
	}
		
	func beforeDisappearing(_ viewController: UIViewController) {
		timer?.invalidate()
	}
	
	@objc func runTimed() {
		print(Date())
	}
}

struct HideNavigationBarBehavior: ViewControllerLifecycleBehavior {
	func beforeAppearing(_ viewController: UIViewController) {
		viewController.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	func beforeDisappearing(_ viewController: UIViewController) {
		viewController.navigationController?.setNavigationBarHidden(false, animated: true)
	}
}

struct ChangeToDarkSyleBeheviour: ViewControllerLifecycleBehavior {
	
	func beforeAppearing(_ viewController: UIViewController) {
		
		viewController.navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
		viewController.view.backgroundColor = UIColor.black
	}
	
	func beforeDisappearing(_ viewController: UIViewController) {
		viewController.navigationController?.navigationBar.barStyle = UIBarStyle.default
		viewController.view.backgroundColor = UIColor.white
	}
}
