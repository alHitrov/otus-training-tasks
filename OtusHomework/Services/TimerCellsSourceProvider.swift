//
//  TimerCellsSourceProvider.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation


struct FormattedTime {
	var time: String
}

struct TimeCellProvider {
    
    func makeData() -> [FormattedTime] {
        return [
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
			FormattedTime(time: "\(Date().formattedTime())"),
		]
    }
}
