//
//  DiagramImageProvider.swift
//  otusSwiftHW
//
//  Created by Exey Panteleev on 06/06/2019.
//  Copyright © 2019 Daria Shumova. All rights reserved.
//

import UIKit

final class DataSourceProvider {
    
    func createSource() -> [String] {
		
		var source: [String] = []
		
		(0...20).forEach { i in
			source.append("item \(i)")
        }
		
		return source
    }
    
}
