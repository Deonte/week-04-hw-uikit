//
//  ViewController.swift
//  week-04-hw-uikit
//
//  Created by Deonte Kilgore on 9/11/22.
//

import UIKit
import SwiftUI

// UIKit Homework
class ViewController: UIViewController {
    
    let tableView = UITableView()
    let menuItems: [MenuItem] = MockMenu.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.reuseID)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemCell.reuseID, for: indexPath) as! MenuItemCell
        let menuItem = menuItems[indexPath.row]
        cell.set(menuItem: menuItem)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        let destinationVC = UIHostingController(rootView: DetailView(menuItem: menuItem))
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

