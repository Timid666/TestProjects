//
//  Presenter.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

class MainVCPresenter {
    
    let view: MainVC
    let network: Network
    
    init(view: MainVC) {
        self.view = view
        network = Network()
        setData()
    }
    
    func setData() {
        network.requestAndGetData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let truckers):
                self.view.setData(truckers!)
            case .failure( _):
                print("ERROR")
            }
        }
    }
    
}
