//
//  MenuItemCell.swift
//  week-04-hw-uikit
//
//  Created by Deonte Kilgore on 9/11/22.
//

import UIKit

class MenuItemCell: UITableViewCell {
    
    static let reuseID = "MenuItemCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(menuItem: MenuItem) {
        titleLabel.text = menuItem.title
    }
    
    private func configure() {
        addSubview(titleLabel)
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
