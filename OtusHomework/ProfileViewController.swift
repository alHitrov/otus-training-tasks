//
//  ProfileViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, RoundedStyleButtonDelegate {
	
//	3 На ViewController таба Profile
//	3.1 написать поведение со сменой цвета статус бара и view.backgroundColor на черный
//	4 На ViewController(первом) таба Feed сделать кнопку
//	4.1 По кнопке пушить новый ViewController(второй)
//	4.2 На новом ViewController добавить еще одну кнопку и по ней показать третий ViewController
//	4.3 Реализовать переход с третьего ViewController на первый
	
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
