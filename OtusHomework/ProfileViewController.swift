//
//  ProfileViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, RoundedStyleButtonDelegate {
	
	var roundedStyleButton = RoundedStyleButton ()

    override func viewDidLoad() {
        super.viewDidLoad()

		setupCustomButton()
		roundedStyleButton.setTitle("custom button", for: .normal)
    }
	
	func setupCustomButton() {
		view.addSubview(roundedStyleButton)
		
		roundedStyleButton.delegate = self;
		
		roundedStyleButton.translatesAutoresizingMaskIntoConstraints = false
		roundedStyleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		roundedStyleButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
		roundedStyleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		roundedStyleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200 ).isActive = true
	}
    
	func RoundedStyleButtonTapped(_ button: RoundedStyleButton) {
		roundedStyleButton.shake()
	}
	
}
