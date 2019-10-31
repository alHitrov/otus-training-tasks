//
//  EndViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 14/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		addBehaviors(behaviors: [HideNavigationBarBehavior()])
	}
	
	@IBAction func popToRoot(_ sender: UIButton) {
//		navigationController?.popViewController(animated: true)
		navigationController?.popToRootViewController(animated: true)
	}
	
}
