//
//  DetailVCPresenter.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

class DetailVCPresenter {
    
    var view: DetailVC
    var network: Network
    
    init(view: DetailVC) {
        self.view = view
        network = Network()
    }
    
    func setData(id: Int) {
        network.requestAndGetDataById(byId: id) { result in
            switch result {
            case .success(let trucker):
                guard let truck = trucker else { return }
                self.view.success(detailTrucker: truck)
            case .failure(let error):
                print(error)
            }
        }
    }
}
