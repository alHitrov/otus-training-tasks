//
//  ProfileViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	var customButton = CustomButton ()

    override func viewDidLoad() {
        super.viewDidLoad()

		setupCustomButton()
		addActionToCustomButton()
		customButton.setTitle("custom button", for: .normal)
    }
	
	func setupCustomButton() {
		view.addSubview(customButton)
		
		customButton.translatesAutoresizingMaskIntoConstraints = false
		customButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		customButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
		customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		customButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200 ).isActive = true
	}
    
	func addActionToCustomButton() {
		customButton.addTarget(self, action: #selector(customButtonTaped), for: .touchUpInside)
	}

	@objc func customButtonTaped() {
		print(#function)
		customButton.shake()
	}
}
