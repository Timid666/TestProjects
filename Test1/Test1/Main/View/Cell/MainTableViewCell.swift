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
        }
    }
    
    private var issueDescription: String = "" {
        didSet {
            descriptionLabel.text = issueDescription
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
