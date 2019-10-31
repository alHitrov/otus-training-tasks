//
//  ProfileViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, CustomButtonDelegate {
	
	@IBOutlet weak var pushNextButton: CustomButton!
	
//	3 На ViewController таба Profile
	
//	3.1 написать поведение со сменой цвета статус бара и view.backgroundColor на черный

	//	4 На ViewController(первом) таба Feed сделать кнопку
	//	4.1 По кнопке пушить новый ViewController(второй)
//	4.2 На новом ViewController добавить еще одну кнопку и по ней показать третий ViewController
//	4.3 Реализовать переход с третьего ViewController на первый
	
	var roundedStyleButton = RoundedStyleButton ()

    override func viewDidLoad() {
        super.viewDidLoad()


		pushNextButton.delegate = self
    }
	
	func customButtonTapped(_ button: CustomButton) {
		performSegue(withIdentifier: "pushNext", sender: self)
	}
	
}
