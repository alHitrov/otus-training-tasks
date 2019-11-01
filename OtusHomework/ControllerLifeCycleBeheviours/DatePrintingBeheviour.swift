//
//  DatePrintingBeheviour.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
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
