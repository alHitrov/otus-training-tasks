//
//  PieChartDiagram.swift
//  OTUSHomework
//
//  Created by Alexey on 28/11/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

@IBDesignable
class PieChartDiagram: PieChartView {
//UIView, PieChartModel {
	
//	var segments: [Segment] = [] {
//		didSet {
//			setNeedsDisplay()
//		}
//	}
//	
//	override var frame: CGRect {
//		didSet {
//			setNeedsLayout()
//		}
//	}
//	
//	private var startAngle : CGFloat = -CGFloat.pi * 0.5
//	private var endAngle : CGFloat = 0
//	
//	private var radius : CGFloat {
//		return min(self.frame.width, self.frame.height) * 0.5
//	}
//	private var viewCenter : CGPoint {
//		return self.bounds.center
//	}
//	
//	private let textPositionOffset: CGFloat = 0.67
//	
//	private var totalSegmentsValue: CGFloat {
//		return segments.reduce(0, {$0 + $1.value})
//	}
//	
//	private lazy var textAttributes: [NSAttributedString.Key: Any] = [
//        .font               : UIFont.systemFont(ofSize: 14),
//        .foregroundColor    : UIColor.black
//    ]
    
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
			Segment(value: 20, title: "one", color: UIColor.random),
			Segment(value: 70, title: "two", color: UIColor.random),
		]
		
		setNeedsDisplay()
    }
    
    override func initialize() {
		isOpaque = false
		
    }
	
    override func draw(_ rect: CGRect) {
		
		super.draw(rect)
		
		guard let context = UIGraphicsGetCurrentContext() else {
			NSLog("Failed to get graphics context")
			return
		}

		var startAngle = -CGFloat.pi * 0.5
		
		for var segment in segments {
			
			segment.startAngle = startAngle
			segment.endAngle = startAngle + segment.angleWidth(totalSegmentsWeight: totalSegmentsValue)
			
			drawSlice(context: context, segment: segment)
			drawSeparator(context: context, segment: segment, drawAngle: segment.startAngle)
			drawText(context: context, segment: segment)
			
			startAngle = segment.endAngle
		}
    }
}
