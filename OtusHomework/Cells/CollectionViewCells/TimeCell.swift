//
//  TitleollectionViewCell.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class TimeCell: UICollectionViewCell {

	@IBOutlet weak var Label: UILabel!
	var observer : NSObjectProtocol?

	static var reuseIdentifier : String {
		return "\(String(describing: self))"
	}
	
	private var timer : Timer?
	private var isNotStarted: Bool {
		return (timer == nil || !(timer?.isValid ?? false))
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
    }
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		
		isNotStarted ? start() : invalidate(notification: .init(name: .invalidate))
	}
	
	private func start() {
			
		print("\(#function) timer: [\(String(describing: self))]")
		timer = Timer.scheduledTimer(timeInterval: 1.0,
									 target: self,
									 selector: #selector(runTimed),
									 userInfo: nil,
									 repeats: true)
		
		observer = NotificationCenter.default.addObserver(forName: .invalidate, object: nil, queue: OperationQueue.main) { (notification) in
			self.invalidate(notification: notification)
		}
	}
	
	@objc func runTimed() {
		
		update(name: Date().formattedTime(), color: .random)
		print("\(#function) time: \(String(describing: Label.text))")
	}
	
	private func invalidate(notification: Notification)  {

		if ((timer?.isValid ?? false) && notification.name == .invalidate) {
			timer?.invalidate()
			NotificationCenter.default.removeObserver(self.observer as Any)
			print("\(#function) timer: [\(String(describing: self))]")
		}
	}
	
	func update(name: String, color: UIColor) {
        Label.text = name
        backgroundColor = color
    }
	
}
