//
//  DetailVC.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var osTypeLabel: UILabel!
    @IBOutlet weak var osVersionLabel: UILabel!
    
    var presenter: DetailVCPresenter!
    
    var id: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DetailVCPresenter(view: self)
        getAndSetData(id: id)
    }
    
    func getAndSetData(id: Int) {
        presenter.setData(id: id)
    }
    
    func success(detailTrucker: TruckerDetail) {
        DispatchQueue.main.async {
            self.nameLabel.text = detailTrucker.bugTrucker.name
            self.productLabel.text = detailTrucker.bugTrucker.description
            self.deviceLabel.text = detailTrucker.bugTrucker.additionalData.Device
            self.osTypeLabel.text = detailTrucker.bugTrucker.additionalData.OsType
            self.osVersionLabel.text = detailTrucker.bugTrucker.additionalData.OsVersion
        }
    }
}
