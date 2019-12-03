//
//  PieChartSegment.swift
//  CoreAnimation2
//
//  Created by Alexey on 28/11/2019.
//  Copyright © 2019 Кирилл Володин. All rights reserved.
//

import UIKit

struct Segment {
    
	var value: CGFloat
    var title: String
	var color: UIColor
	
	var textPositionOffset: CGFloat = 0.67

	var textAttributes: [NSAttributedString.Key: Any] = [
        .font               : UIFont.systemFont(ofSize: 14),
        .foregroundColor    : UIColor.black
    ]
	
	var separatorWidth: CGFloat = 2
	
	var startAngle : CGFloat = 0
	var endAngle : CGFloat = 0
	
	var halfAngle : CGFloat {
		return startAngle + (endAngle - startAngle) * 0.5
	}
	
	func angleWidth(totalSegmentsWeight:CGFloat) -> CGFloat {
		return totalSegmentsWeight <= 0 ? 0 : (2 * .pi * (value / totalSegmentsWeight))
	}

}
