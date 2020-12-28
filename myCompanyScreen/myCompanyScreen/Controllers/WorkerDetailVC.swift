////
////  WorkerDetailVC.swift
////  myCompanyScreen
////
////  Created by Berkin KABADAYI on 28.12.2020.
////
//
//import UIKit
//
//class WorkerDetailVC: UIViewController {
//
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var ageLabel: UILabel!
//    @IBOutlet weak var salaryLabel: UILabel!
//    
//    // MARK: - PROPERTIES
//    
//    var worker: EmployeeP?
//    
//    // MARK: - LIFE CYCLE METHODS
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        prepareUI()
//    }
//    
//    // MARK: - PREPARE UI
//    
//    fileprivate func prepareUI() {
//        nameLabel.text = worker?.name
//        ageLabel.text = String (worker?.age ?? 0)
//        salaryLabel.text = String (worker?.getCost() ?? 0)
//    }
//}
