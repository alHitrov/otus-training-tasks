//
//  PieChartSourceProvider.swift
//  OTUSHomework
//
//  Created by Alexey on 29/11/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import Foundation


struct PieChartProvider {
    
    func makeData() -> [PieChartRenderingProtocol] {
        return [
			CalculateTimeBeheviour(),
			AnimateFanBeheviour(),
			CalculateTimeBeheviour(),
			AnimateFanBeheviour(),
			CalculateTimeBeheviour(),
			AnimateFanBeheviour(),
			CalculateTimeBeheviour(),
			AnimateFanBeheviour(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
//			CalculatedTimePieChart(),
		]
    }
}
