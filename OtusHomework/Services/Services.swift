//
//  Services.swift
//  otusSwiftHW
//
//  Created by Exey Panteleev on 06/06/2019.
//  Copyright © 2019 Daria Shumova. All rights reserved.
//

import Foundation

class Services {
    
    static var dataSourceProvider: DataSourceProvider = {
        return DataSourceProvider()
    }()
    
}
