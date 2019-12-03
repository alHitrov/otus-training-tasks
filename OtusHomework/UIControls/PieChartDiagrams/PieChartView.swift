//
//  PieChartView.swift
//  OTUSHomework
//
//  Created by Alexey on 03/12/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation
import UIKit

class PieChartView: UIView, PieChartModel {
	
	var segments: [Segment] = [] {
		didSet {
			setNeedsDisplay()
		}
	}
	
	override var frame: CGRect {
		didSet {
			setNeedsLayout()
		}
	}
	
	private var radius : CGFloat {
		return min(self.frame.width, self.frame.height) * 0.5
	}
	private var viewCenter : CGPoint {
		return self.bounds.center
	}
	
	var totalSegmentsValue: CGFloat {
		return segments.reduce(0, {$0 + $1.value})
	}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
	func initialize() {
    }
	
	func update() {
		self.setNeedsDisplay()
	}
	
    override func draw(_ rect: CGRect) {
		super.draw(rect)
    }
}

extension PieChartView {

	func drawSlice(context: CGContext, segment:Segment) {
		
		context.setFillColor(segment.color.cgColor)
		context.move(to: viewCenter)
		context.addArc(center: viewCenter, radius: radius, startAngle: segment.startAngle, endAngle: segment.endAngle, clockwise: false)
		context.fillPath()
	}

	func drawSeparator(context: CGContext, segment:Segment, drawAngle: CGFloat) {

		context.setStrokeColor(UIColor.black.cgColor)
		context.move(to: viewCenter)
		context.addLine(to: CGPoint(center: viewCenter, radius: radius, degrees: drawAngle))
		context.setLineWidth(segment.separatorWidth)
		context.strokePath()
	}
	
	func drawText(context: CGContext, segment:Segment) {
		
		let segmentCenter = viewCenter.projected(by: radius * segment.textPositionOffset, angle: segment.halfAngle)
		let textToRender = segment.title as NSString
		let renderRect = CGRect(centeredOn: segmentCenter, size: textToRender.size(withAttributes: segment.textAttributes))
		textToRender.draw(in: renderRect, withAttributes: segment.textAttributes)
	}
}
