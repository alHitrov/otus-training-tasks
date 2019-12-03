//
//  CalculatedTimePieChartCell.swift
//  OTUSHomework
//
//  Created by Alexey on 28/11/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class CalculatedTimePieChartCell: UICollectionViewCell {

	private var observer : NSObjectProtocol?
	
	@IBOutlet weak var pieChartDiagram: PieChartDiagram!

	private var calculatedTimePieChart:PieChartRenderingProtocol!
	
	static var reuseIdentifier : String {
		return "\(String(describing: self))"
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
		self.backgroundColor = UIColor.random
    }
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		
		calculatedTimePieChart?.isNotStarted ?? false ? start() : stop()
	}
	
	private func start() {
		
		observer = NotificationCenter.default.addObserver(forName: .invalidate, object: nil, queue: OperationQueue.main) { (notification) in
			
			if (notification.name == .invalidate) {
				self.stop()
			}
			
		}
		calculatedTimePieChart.start()
	}
	
	private func stop() {
		
		NotificationCenter.default.removeObserver(self.observer as Any)
		calculatedTimePieChart?.stop()
	}
	
	func insertSourceModel(model: PieChartRenderingProtocol) {

		model.setupPieChart(model: pieChartDiagram)
		calculatedTimePieChart = model
	}
	
	func update()  {
		
		calculatedTimePieChart?.updateSegments()
	}
	
	override func setNeedsLayout() {
		super.setNeedsLayout()
		
		pieChartDiagram?.frame = CGRect(centeredOn: CGPoint.init(x: self.bounds.width/2, y: self.bounds.height/2),
										size: CGSize(width: self.bounds.width, height: self.bounds.width))
		
		calculatedTimePieChart?.updateSegments()
	}
    
}
