//
//  FeedViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController,  CustomButtonDelegate {
	
	
	@IBOutlet weak var customButton: CustomButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		customButton.delegate = self;
    }

   func customButtonTapped(_ button: CustomButton) {
		print(#function + "from viewConteroller")
   }

}
