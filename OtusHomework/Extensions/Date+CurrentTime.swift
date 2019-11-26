//
//  Date+CurrentTime.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation

extension Date {
	
	func formattedTime() -> String {
		
		let formatter = DateFormatter()
		formatter.timeStyle = .medium
		return formatter.string(from: Date()) // "12 AM"
	}
}


