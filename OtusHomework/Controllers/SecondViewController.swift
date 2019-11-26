//
//  SecondViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, RoundedStyleButtonDelegate {
		
	@IBOutlet weak var roundedSytleButton: RoundedStyleButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
		roundedSytleButton.delegate = self;
    }

	func RoundedStyleButtonTapped(_ button: RoundedStyleButton) {
		button.shake()
	}
	
}
