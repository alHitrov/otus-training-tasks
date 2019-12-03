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
	
	private var chartSource : [PieChartRenderingProtocol]?
	private var dataSource: [PieChartRenderingProtocol] {
		
		if (chartSource == nil) {
			chartSource = Services.pieChartCellProvider.makeData()
		}
		return chartSource!
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

		collectionView.register(UINib(nibName: CalculatedTimePieChartCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CalculatedTimePieChartCell.reuseIdentifier)
		collectionView.register(UINib(nibName: FanPieChartCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FanPieChartCell.reuseIdentifier)

		
        collectionView.delegate = self
        collectionView.dataSource = self

		addBehaviors(behaviors: [PrintDateBehavior()])

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeLayout))
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "pie chart update", style: .plain, target: self, action: #selector(updateCollectionView))

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
	
	@objc func updateCollectionView() {
		collectionView.reloadData()
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
		
		let model : PieChartRenderingProtocol = dataSource[indexPath.row]
		var cell : UICollectionViewCell?
		
		if model is AnimateFanBeheviour {
			
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: FanPieChartCell.reuseIdentifier, for: indexPath) as! FanPieChartCell
			(cell as! FanPieChartCell).insertSourceModel(model: dataSource[indexPath.row])
		}
		
		if (model is CalculateTimeBeheviour) {
			
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatedTimePieChartCell.reuseIdentifier, for: indexPath) as! CalculatedTimePieChartCell
			(cell as! CalculatedTimePieChartCell).insertSourceModel(model: dataSource[indexPath.row])
		}
		
		return cell!
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
