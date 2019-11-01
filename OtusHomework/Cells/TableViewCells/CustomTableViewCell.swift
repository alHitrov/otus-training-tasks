//
//  CustomTableViewCell.swift
//  OTUSHomework
//
//  Created by Alexey on 31/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet weak var title: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

		if (selected) {}
    }

}
