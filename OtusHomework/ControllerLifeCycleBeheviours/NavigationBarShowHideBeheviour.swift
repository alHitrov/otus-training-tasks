//
//  NavigationBarShowHideBeheviour.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

struct HideNavigationBarBehavior: ViewControllerLifecycleBehavior {
	func beforeAppearing(_ viewController: UIViewController) {
		viewController.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	func beforeDisappearing(_ viewController: UIViewController) {
		viewController.navigationController?.setNavigationBarHidden(false, animated: true)
	}
}

struct ShowNavigationBarBehavior: ViewControllerLifecycleBehavior {
	func beforeAppearing(_ viewController: UIViewController) {
		viewController.navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	func beforeDisappearing(_ viewController: UIViewController) {
		
	}
}
