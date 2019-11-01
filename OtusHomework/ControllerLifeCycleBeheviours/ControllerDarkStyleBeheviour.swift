//
//  DarkStyleBeheviour.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

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
