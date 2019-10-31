//
//  BenchMarkViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class BenchmarkViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		print(#function)
		
		addBehaviors(behaviors: [PrintDateBehavior()])
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		print(#function)
	}
    
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		print(#function)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		print(#function)
	}
	
}
