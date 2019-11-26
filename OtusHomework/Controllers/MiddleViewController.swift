//
//  MiddleViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 14/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class MiddleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		addBehaviors(behaviors: [ChangeToDarkSyleBeheviour()])
    }
    

}
