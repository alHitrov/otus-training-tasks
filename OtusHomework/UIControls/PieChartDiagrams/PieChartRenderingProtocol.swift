//
//  TimeChartProtocol.swift
//  OTUSHomework
//
//  Created by Alexey on 02/12/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation
import UIKit

protocol PieChartRenderingProtocol {

	var isNotStarted: Bool { get }
	func setupPieChart(model: PieChartModel)
	func start()
	func stop()
	func updateSegments()
	
}
