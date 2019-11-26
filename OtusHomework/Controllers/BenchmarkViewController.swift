//
//  BenchMarkViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class BenchmarkViewController: UIViewController {
	
	@IBOutlet var collectionView: UICollectionView!
	
	private var dataSource: [FormattedTime] {
		return Services.timeCellProvider.makeData()
	}
	
	private enum Layout {
	   case grid
	   case stag
	}
	
	private var stagLayout: StagLayout {
		return StagLayout(
		   widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 1.5), (0.5, 1.0)],
		   itemSpacing: 4
		)
	}
	
	private let gridLayout = CustomCollectionViewLayout()
    private var isGrid = true
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.register(UINib(nibName: TimeCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: TimeCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self

		addBehaviors(behaviors: [PrintDateBehavior()])

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeLayout))

		changeLayout()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		invalidateTimers()
	}
	
	func invalidateTimers()  {
		NotificationCenter.default.post(name: .invalidate, object: self)
	}
	
	@objc func changeLayout() {
	   isGrid.toggle()
	   if isGrid {
		   gridLayout.delegate = self
		   collectionView.setCollectionViewLayout(gridLayout, animated: true)
	   } else {
		   collectionView.setCollectionViewLayout(stagLayout, animated: true)
	   }
	}
}

extension BenchmarkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCell.reuseIdentifier, for: indexPath) as! TimeCell
		
		let timeData = dataSource[indexPath.item]
		cell.update(name: timeData.time, color: UIColor.random)
		
		return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
}

extension BenchmarkViewController: CustomCollectionViewDelegate {
    func numberOfItemsInCollectionView() -> Int {
        return dataSource.count
    }
}
