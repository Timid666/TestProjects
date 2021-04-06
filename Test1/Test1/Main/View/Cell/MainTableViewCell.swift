//
//  MainTableViewCell.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var name: String = "" {
        didSet {
            nameLabel.text = name
            nameLabel.textColor = UIColor(red: 2/255, green: 119/255, blue: 189/255, alpha: 1)
        }
    }
    
    private var issueDescription: String = "" {
        didSet {
            descriptionLabel.text = issueDescription
            descriptionLabel.textColor = UIColor(red: 50/255, green: 119/255, blue: 189/255, alpha: 1)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(_ name: String, _ description: String) {
        self.name = name
        self.issueDescription = description
    }
}
