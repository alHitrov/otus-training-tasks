//
//  FanPieChartCell.swift
//  OTUSHomework
//
//  Created by Alexey on 03/12/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class FanPieChartCell: UICollectionViewCell {
	
	@IBOutlet weak var fanPieChart: FanPieChart!
	private var fanPieChartDrawing: PieChartRenderingProtocol!
	
	var isRunning : Bool = false
	
	static var reuseIdentifier : String {
		return "\(String(describing: self))"
	}

	override func awakeFromNib() {
        super.awakeFromNib()
		self.backgroundColor = UIColor.random
    }

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		
		isRunning ? stop() : start()
		
		isRunning = !isRunning
	}
	
	private func start() {
		fanPieChartDrawing.start()
	}
	
	private func stop() {
		fanPieChartDrawing?.stop()
	}
	
	func insertSourceModel(model: PieChartRenderingProtocol) {

		model.setupPieChart(model: fanPieChart)
		fanPieChartDrawing = model
	}
	
	override func setNeedsLayout() {
		super.setNeedsLayout()

		fanPieChart?.frame = CGRect(centeredOn: CGPoint.init(x: self.bounds.width/2, y: self.bounds.height/2),
									size: CGSize(width: self.bounds.width, height: self.bounds.width))
		
		fanPieChartDrawing?.updateSegments()
	}
	
}
