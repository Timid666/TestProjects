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
    var page = 1
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        presenter = MainVCPresenter(view: self)
        title = "Отзывы"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor(red: 137/255, green: 41/255, blue: 133/255, alpha: 1)
        
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                     NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 18)
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        
        let loadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingCellNib, forCellReuseIdentifier: "loadingCell")
    }

    func setData(_ truckers: BugTruckers) {
        DispatchQueue.main.async {
            if self.truckers == nil {
                self.truckers = truckers
            } else {
                for i in 0..<truckers.bugTruckers.count {
                    self.truckers?.bugTruckers.append(truckers.bugTruckers[i])
                }
            }
            self.tableView.reloadData()
        }
    }
}

extension MainVC: UITableViewDelegate {}

extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return truckers?.bugTruckers.count ?? 0
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
            let trucker = truckers?.bugTruckers[indexPath.row]
            cell.setData(trucker?.name ?? "", trucker?.description ?? "")
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.init(red: 179/255, green: 229/255, blue: 252/255, alpha: 1)
            } else {
                cell.backgroundColor = UIColor.init(red: 252/255, green: 164/255, blue: 73/255, alpha: 1)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.loadingIndicator.startAnimating()
            if truckers?.bugTruckers.count ?? 0 == truckers?.bugTrackersCount ?? 0 {
                cell.loadingIndicator.stopAnimating()
                cell.isHidden = true
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        let totalPages = truckers?.totalPages
        
        if indexPath.row == (truckers?.bugTruckers.count ?? 0) - 1 {
            if !isLoading {
                isLoading = true
                page += 1
                print(page)
                if page > totalPages ?? 0 && indexPath.row == (truckers?.bugTruckers.count ?? 0) - 1 {
                    return
                }
                presenter.pagination(byPage: page)
                isLoading = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = UIStoryboard(name: "DetailStoryboard", bundle: nil).instantiateViewController(identifier: "detailVC") as! DetailVC
        let detailTrucker = truckers?.bugTruckers[indexPath.row]
        detailVC.id = detailTrucker?.id ?? 0
        navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
