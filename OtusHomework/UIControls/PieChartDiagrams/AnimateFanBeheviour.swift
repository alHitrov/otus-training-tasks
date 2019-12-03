//
//  AnimateFanTimePieChart.swift
//  OTUSHomework
//
//  Created by Alexey on 02/12/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation
import UIKit

class AnimateFanBeheviour: PieChartRenderingProtocol {
	
	private var pieChart: PieChartModel?
	
	private var segmentLeft = Segment(value: 0, title: "", color: UIColor.random)
	private var segmentFill = Segment(value: 1000, title: "", color: UIColor.random)
	private var segmentRight = Segment(value: 0, title: "", color: UIColor.random)
	
	private var timer : Timer?
	private var isRunning = false
	var isNotStarted: Bool {
		return (timer == nil || !(timer?.isValid ?? false))
	}
	
	func setupPieChart(model: PieChartModel) {
		pieChart = model
	}
	
	func updateSegments() {
	
		if isRunning {
			if (segmentFill.value <= 0) {
				stop()
			} else {
				segmentRight.value += 10
				segmentLeft.value += 10
				segmentFill.value -= 20
			}
		}
		
		pieChart?.segments = [segmentLeft, segmentFill, segmentRight]
		pieChart?.update()
	}
	
	func start() {
		
		if isNotStarted {
			
			self.resetIfNeeded()
			
			timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
				self.updateSegments()
			})
			
			isRunning = true

			self.updateSegments()
		}
	}
	
	func stop() {
		
		if timer?.isValid ?? false {
			
			timer?.invalidate()
			timer = nil
			isRunning = false
			
			self.updateSegments()
		}
	}
	
	
	func resetIfNeeded() {
		
		if (segmentFill.value <= 0) {
			
			segmentRight.value = 0
			segmentLeft.value = 0
			segmentFill.value = 1000
			
		}
	}
	
	
}

