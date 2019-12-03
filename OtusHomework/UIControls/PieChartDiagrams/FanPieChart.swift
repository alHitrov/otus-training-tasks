//
//  FanPieChart.swift
//  OTUSHomework
//
//  Created by Alexey on 02/12/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class FanPieChart: PieChartView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
		segments = [
			Segment(value: 10, title: "one", color: UIColor.red),
			Segment(value: 100, title: "fill", color: UIColor.orange),
			Segment(value: 10, title: "two", color: UIColor.green),
		]

		setNeedsDisplay()
    }
    
    override func initialize() {
		isOpaque = false
    }
	
    override func draw(_ rect: CGRect) {
		
		super.draw(rect)

		if (segments.count == 0) { return }
		
		guard let context = UIGraphicsGetCurrentContext() else {
			NSLog("Failed to get graphics context")
			return
		}

		var startAngle = -CGFloat.pi * 0.5
		for var segment in segments {

			segment.startAngle = startAngle
			segment.endAngle = startAngle + segment.angleWidth(totalSegmentsWeight: totalSegmentsValue)
			
			self.drawSlice(context: context, segment: segment)

			startAngle = segment.endAngle
		}
    }
}
