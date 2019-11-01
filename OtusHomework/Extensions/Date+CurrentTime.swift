//
//  Date+CurrentTime.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation

extension Date {
	
	func currentTime() -> String {
//		let date = self
//		let calendar = Calendar.current
//		let hour = calendar.component(.hour, from: date)
//		let minutes = calendar.component(.minute, from: date)
//		let seconds = calendar.component(.second, from: date)
//		return "\(hour):\(minutes):\(seconds)"
		
		let formatter = DateFormatter()
		formatter.dateFormat = "hh:mm:ss a" // "a" prints "pm" or "am"
		return formatter.string(from: Date()) // "12 AM"
	}
}


