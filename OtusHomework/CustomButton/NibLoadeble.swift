//
//  NibLoadeble.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

public protocol NibLoadable {
	
    static var nibName: String { get }

    func loadFromNib(owner: Any?)
}

public extension NibLoadable where Self: UIView {

    static var nibName: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }

    func loadFromNib(owner: Any? = nil) {
        
		guard let view = Self.nib.instantiate(withOwner: owner, options: nil).first as? UIView else {
            fatalError("Error loading \(Self.nibName) from nib")
        }
		
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
