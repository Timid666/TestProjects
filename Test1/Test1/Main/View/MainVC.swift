//
//  ViewController.swift
//  Test1
//
//  Created by Саид on 02.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var truckers: BugTruckers?
    var presenter: MainVCPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        presenter = MainVCPresenter(view: self)
    }

    func setData(_ truckers: BugTruckers) {
        DispatchQueue.main.async {
            self.truckers = truckers
            self.tableView.reloadData()
        }
    }

}

extension MainVC: UITableViewDelegate {}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        truckers?.bugTruckers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        let trucker = truckers?.bugTruckers[indexPath.row]
        
        cell.setData(trucker?.name ?? "", trucker?.description ?? "")
        
        if indexPath.row == truckers?.bugTruckers.count {
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = UIStoryboard(name: "DetailStoryboard", bundle: nil).instantiateViewController(identifier: "detailVC") as! DetailVC
        let detailTrucker = truckers?.bugTruckers[indexPath.row]
        detailVC.id = detailTrucker?.id ?? 0
        present(detailVC, animated: true)
    }
}
