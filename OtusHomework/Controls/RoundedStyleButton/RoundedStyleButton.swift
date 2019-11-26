//
//  CustomButton.swift
//  OTUSHomework
//
//  Created by Alexey on 09/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

protocol RoundedStyleButtonDelegate: class {
    func RoundedStyleButtonTapped(_ button: RoundedStyleButton)
}

@IBDesignable class RoundedStyleButton: UIButton {
	
	weak var delegate: RoundedStyleButtonDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
	
		guard let view = loadViewFromNib() as? UIButton else { return }
		
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		addSubview(view)
		
		setupLayers()

		view.addTarget(self, action: #selector(customButtonTaped), for: .touchUpInside)
	 }
	
	func loadViewFromNib() -> UIView? {
		
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as? UIButton
	}

	@objc func customButtonTaped() {

		print(#function)
		delegate?.RoundedStyleButtonTapped(self)
	}
	
	func setupLayers()  {
		 
		setShadow()
		
		setTitleColor(.white, for: .normal)
		titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)

		backgroundColor = .blue
		
		layer.cornerRadius = 25
		layer.borderWidth = 3.0
		layer.borderColor = UIColor.darkGray.cgColor
	}
		
	private func setShadow() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
		layer.shadowRadius = 8
		layer.shadowOpacity = 0.5
		clipsToBounds = true
		layer.masksToBounds = true
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
