//
//  CustomButton.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

protocol CustomButtonDelegate: class {
    func customButtonTapped(_ button: CustomButton)
}

@IBDesignable class CustomButton: UIView, NibLoadable {
	
	@IBOutlet weak var customButton: UIButton!
	weak var delegate: CustomButtonDelegate?
	
	@IBInspectable var cornerRadius: CGFloat = 0 {
		didSet {
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat = 0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	
	@IBInspectable var borderColor: UIColor = UIColor.black {
		didSet {
			layer.borderColor = borderColor.cgColor
		}
	}

	@IBInspectable var title : String = "" {
		didSet {

			customButton.setTitle(title, for: .normal)
			
			if (!title.isEmpty) {
				let space : CGFloat = 8
				customButton.contentEdgeInsets = UIEdgeInsets(top: customButton.titleEdgeInsets.top,
															  left: customButton.titleEdgeInsets.left + space,
															  bottom: customButton.titleEdgeInsets.bottom,
															  right: customButton.titleEdgeInsets.right + space)

			}
				
		}
	}
	
	@IBInspectable var titleColor: UIColor = UIColor.white {
		didSet {
			customButton.setTitleColor(titleColor, for: .normal)
		}
	}
	
	@IBInspectable var layerBackgroundColor: UIColor = UIColor.white {
		didSet {
			customButton.backgroundColor = layerBackgroundColor
		}
	}
	
	convenience init() {
	  self.init(frame: .zero)
	}

	override init(frame: CGRect) {
	  super.init(frame: frame)
	  loadFromNib(owner: self)
	}

	required init?(coder aDecoder: NSCoder) {
	  super.init(coder: aDecoder)
	  loadFromNib(owner: self)
	}
	
	@IBAction func customButtonTouchUpInside(_ sender: UIButton) {
		print(#function)
		delegate?.customButtonTapped(self)
	}
	
	func shake() {
		 
		let shake = CABasicAnimation(keyPath: "position")
		shake.duration = 0.1
		shake.repeatCount = 2
		shake.autoreverses = true
		
		let fromPoint = CGPoint(x: center.x - 8, y: center.y)
		let fromValue = NSValue(cgPoint: fromPoint)
		
		let toPoint = CGPoint(x: center.x + 8, y: center.y)
		let toValue = NSValue(cgPoint: toPoint)
		
		shake.fromValue = fromValue
		shake.toValue = toValue
		
		layer.add(shake, forKey: "position")
	}
	
}
