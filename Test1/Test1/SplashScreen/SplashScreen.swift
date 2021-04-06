//
//  SplashScreen.swift
//  Test1
//
//  Created by Саид on 06.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 115))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animate()
        }
    }
    
    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
        }
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }) { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mainVC") as! MainVC
                    mainVC.navigationItem.setHidesBackButton(true, animated: true)
                    self.navigationController?.pushViewController(mainVC, animated: true)
                }
            }
        }
    }
}
