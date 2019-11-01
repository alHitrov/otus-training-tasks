//
//  TitleollectionViewCell.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {

	@IBOutlet weak var Label: UILabel!
	
	weak var timer : Timer?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
    }
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		if (timer == nil) {
			
			timer = Timer.scheduledTimer(timeInterval: 1.0,
			target: self,
			selector: #selector(runTimed),
			userInfo: nil,
			repeats: true)
		} else {
			timer?.invalidate()
			timer = nil
		}
	}
	
	func update(name: String, color: UIColor) {
        Label.text = name
        backgroundColor = color
    }
	
	@objc func runTimed() {
		Label.text = Date().currentTime()
		backgroundColor = .random
	}
}
