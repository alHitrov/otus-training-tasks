//
//  FeedViewController.swift
//  OTUSHomework
//
//  Created by Alexey on 10/10/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var source: [String] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		fillSource()
		tableView.dataSource = self
		tableView.delegate = self
		tableView.tableFooterView = UIView()

		
		let barButtonItem = UIBarButtonItem()
		barButtonItem.title = ""
		navigationItem.backBarButtonItem = barButtonItem
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		tableView.reloadData()
	}

	func fillSource() {
		source = Services.dataSourceProvider.createSource()
	}
	
}

extension FeedViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return source.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier:"customCell") as! CustomTableViewCell
		
		cell.title.text = source[indexPath.row]
		
		return cell
	}
	
}

extension FeedViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)
		
		navigationController?.pushViewController(SessionSummaryViewController(), animated: true)
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 50;
	}
	
}
