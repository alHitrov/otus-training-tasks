//
//  BenchMarkViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {

	
	//	2 Реализовать View controller lifecycle behaviors для вью контоллера Benchmark
//	2.1 Добавить поведение afterAppearing c запуском таймера:
//	timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
//	В runTimed сделайте принт, например так print(Date())
//	2.2 На beforeDisappearing вызвать таймеру invalidate() чтобы на других экранах он не тикал и не принтил
	
    override func viewDidLoad() {
        super.viewDidLoad()

		print(#function)
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
