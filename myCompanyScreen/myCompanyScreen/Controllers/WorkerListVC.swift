//
//  WorkerListVC.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 27.12.2020.
//

import UIKit

protocol WorkerListDelegate: class {
    func getWorkerCount() -> Int
    func getWorkerList() -> [EmployeeP]
}

final class WorkerListVC: UIViewController {
    
    @IBOutlet weak var workerInfoLabel: UILabel!
    @IBOutlet weak var tableViewInfoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: WorkerListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    fileprivate func prepareUI() {
        prepareAllLayers()
        prepareTableView()
    }
    
    fileprivate func prepareAllLayers() {
        prepareLayers(object: workerInfoLabel as Any)
        prepareLayers(object: tableViewInfoLabel as Any)
        prepareLayers(object: tableView as Any)
        tableViewInfoLabel.text = "Name \t \t \t \t     Age \t \t \t \t   Salary" 
    }
    
    fileprivate func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TableViewWorkerList", bundle: nil), forCellReuseIdentifier: "TableViewWorkerList")
        tableView.reloadData()
    }
    
    fileprivate func prepareLayers(object: Any) {
        if let object = object as? UIControl {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UIView {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension WorkerListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.delegate?.getWorkerCount() ?? 0) // ?? 0 a neden gerek var
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewWorkerList") as! TableViewWorkerList
        cell.setCell(newWorker: (self.delegate?.getWorkerList()[indexPath.row])!)
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension WorkerListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//extension WorkerListVC: TableViewWorkerListDelegate {
//    func goWorkerDetail(worker: EmployeeP) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "WorkerDetailVC") as! WorkerDetailVC
//        vc.worker = worker
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
