//
//  TableViewWorkerList.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 27.12.2020.
//

import UIKit

//protocol TableViewWorkerListDelegate: class {
//    func goWorkerDetail(worker: EmployeeP)
//}

class TableViewWorkerList: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellView: TableViewWorkerList!
//    @IBOutlet weak var goDetailsButton: UIButton!
    
//    weak var delegate: TableViewWorkerListDelegate?
//    private var worker : EmployeeP?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareLayer(object: cellLabel as Any)
        //cellView.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 7
            object.layer.masksToBounds = true
        }
    }
    func setCell (newWorker: EmployeeP) {
        cellLabel.text = newWorker.name + "\t \t \t \t " + String (newWorker.age) + "\t \t \t \t \t     " + String(newWorker.getCost())
    }
//    @IBAction func goDetailsButtonTouched(_ sender: Any) {
//        if let worker = self.worker {
//            self.delegate?.goWorkerDetail(worker: worker)
//        }
//    }
}
