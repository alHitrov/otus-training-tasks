//
//  ProfileViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController, CustomButtonDelegate {
	
	@IBOutlet weak var pushNextButton: CustomButton!
	
	var roundedStyleButton = RoundedStyleButton ()

    override func viewDidLoad() {
        super.viewDidLoad()

		addBehaviors(behaviors: [ShowNavigationBarBehavior()])

		pushNextButton.delegate = self
    }
	
	func customButtonTapped(_ button: CustomButton) {
		performSegue(withIdentifier: "pushNext", sender: self)
	}
	
}
