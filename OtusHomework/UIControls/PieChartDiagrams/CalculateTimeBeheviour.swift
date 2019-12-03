//
//  CalculatedTimePieChart.swift
//  CoreAnimation2
//
//  Created by Alexey on 28/11/2019.
//  Copyright © 2019 Кирилл Володин. All rights reserved.
//

import Foundation
import UIKit

class CalculateTimeBeheviour: PieChartRenderingProtocol {
	
	private var pieChart: PieChartModel?
	private var executionSegment = Segment(value: 0, title: "execution: \(0)", color: UIColor.random)
	private var pausedSegment = Segment(value: 0, title: "execution: \(0)", color: UIColor.random)
	

	private var timer : Timer?
	private var isRunning = false
	
	private var executionTime:Double = 0
	private var tempExecutionTime:Double = 0
	
	private var inPauseTime:Double = 0
	private var tempInPauseTime:Double = 0
	
	private var timeStart:Date = Date()
	private var timeStop:Date = Date()
	
	var isNotStarted: Bool {
		return (timer == nil || !(timer?.isValid ?? false))
	}
	
	func setupPieChart(model: PieChartModel) {
		pieChart = model
	}
	
	func updateSegments() {
		
		if (isRunning == false) {
			self.recalculateInPauseTime()
		}
		
		let executionTimeValue = rounded(val: executionTime + tempExecutionTime)
		let inPauseTimeValue = rounded(val: inPauseTime + tempInPauseTime)
		
		let executionTitle = "execution: \(executionTimeValue)"
		let inPauseTitle = "paused: \(inPauseTimeValue)"
		
		executionSegment.value = CGFloat(executionTimeValue)
		executionSegment.title = executionTitle
		
		pausedSegment.value = CGFloat(inPauseTimeValue)
		pausedSegment.title = inPauseTitle
		
		pieChart?.segments = [executionSegment, pausedSegment]
		pieChart?.update()
	}
	
	func start() {
		
		if isNotStarted {
			
			timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in

				self.recalculateExecutionTime()
				self.updateSegments()
			})
			isRunning = true
			
			timeStart = Date()
			
			self.recalculateInPauseTime()
			inPauseTime += tempInPauseTime
			tempInPauseTime = 0

			self.updateSegments()
		}
	}
	
	func stop() {
		
		if timer?.isValid ?? false {
			
			timer?.invalidate()
			timer = nil
			isRunning = false
			
			timeStop = Date()
			
			executionTime += tempExecutionTime
			tempExecutionTime = 0
						
			self.updateSegments()
		}
	}
	
	private func recalculateInPauseTime() {
		tempInPauseTime = rounded(val: Date().timeIntervalSince(timeStop))
	}
	
	private func recalculateExecutionTime() {
		tempExecutionTime = rounded(val: Date().timeIntervalSince(timeStart))
	}
	
	private func rounded(val:Double) -> Double {
		return Double(round(100*val)/100)
	}
}
