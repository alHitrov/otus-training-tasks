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
	
	private var dataSource: [FormattedTime] = Services.timeCellProvider.makeData()
	private let cell = "\(TimeCell.self)"
	
	private enum Layout {
		   case grid
		   case stag
	}
	
	private let stagLayout = StagLayout(
		   widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 1.5), (0.5, 1.0)],
		   itemSpacing: 4
	)
	
	private let gridLayout = CustomCollectionViewLayout()
    private var isGrid = true
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        collectionView.delegate = self
        collectionView.dataSource = self
		
		addBehaviors(behaviors: [PrintDateBehavior()])
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeLayout))
		
		changeLayout()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as? TimeCell
		else {
			return UICollectionViewCell()
		}
        
		let timeData = dataSource[indexPath.item]
		cell.update(name: timeData.time, color: UIColor.random)
		
        return cell
    }
}

extension BenchmarkViewController: CustomCollectionViewDelegate {
    func numberOfItemsInCollectionView() -> Int {
        return dataSource.count
    }
}

