//
//  PieChartModel.swift
//  OTUSHomework
//
//  Created by Alexey on 28/11/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

protocol PieChartModel {
	
	var segments: [Segment] { get set }
	var frame: CGRect { get set }
	func update()
}
