//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 17.12.2020.
//

import UIKit
import Toast
class ViewController: UIViewController {
    //Buttons
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    //Labels
    @IBOutlet weak var compNameLabel: UILabel!
    @IBOutlet weak var numberOfWorkerLabel: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!
    //Text Fields
    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAgeTF: UITextField!
    @IBOutlet weak var enterJobPositionTF: UITextField!
    //Add Worker Button
    @IBOutlet weak var addWorkerButton: UIButton!
    @IBOutlet weak var enterpriceTF: UITextField!
    
    var budget = 1000000
    var totalSalary = 0
    let hakan = Assistant()
    let berkin = Assistant()
    let kaan = Director()
    let myCompany = CompanyP()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hakan.age = 20
        hakan.name = "Hakan"
                
        berkin.age = 25
        berkin.name = "Berkin"
                
        kaan.age = 30
        kaan.name = "Kaan"
                
        myCompany.workers = [hakan, berkin, kaan]
                
        // paySalary button view change
        paySalaryButton.layer.cornerRadius = 10
        paySalaryButton.layer.masksToBounds = true
                
        // addIncome button view change
        addIncomeButton.layer.cornerRadius = 10
        addIncomeButton.layer.masksToBounds = true
        
        // addOutcome button view change
        addOutcomeButton.layer.cornerRadius = 10
        addOutcomeButton.layer.masksToBounds = true
        
        // compNameLabel view change
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.masksToBounds = true
        
        // numberOfWorkerLabel view change
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.masksToBounds = true
        
        // companyBudgetLabel view change
        companyBudgetLabel.layer.cornerRadius = 10
        companyBudgetLabel.layer.masksToBounds = true
        
        // enterName text field view change
        enterNameTF.layer.borderColor = UIColor.blue.cgColor
        enterNameTF.layer.borderWidth = 1
        enterNameTF.layer.cornerRadius = 10
        enterNameTF.layer.masksToBounds = true
        
        // enterAge text field view change
        enterAgeTF.layer.borderColor = UIColor.blue.cgColor
        enterAgeTF.layer.borderWidth = 1
        enterAgeTF.layer.cornerRadius = 10
        enterAgeTF.layer.masksToBounds = true
        
        // enterJobPosition text field view change
        enterJobPositionTF.layer.borderColor = UIColor.blue.cgColor
        enterJobPositionTF.layer.borderWidth = 1
        enterJobPositionTF.layer.cornerRadius = 10
        enterJobPositionTF.layer.masksToBounds = true
        
        // addNewWorker button view change
        addWorkerButton.layer.cornerRadius = 10
        addWorkerButton.layer.masksToBounds = true
        addWorkerButton.layer.borderColor = UIColor.blue.cgColor
        addWorkerButton.layer.borderWidth = 1
    }
    
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
        for item in myCompany.workers {
            totalSalary += item.getCost()
        }
        budget -= totalSalary
        totalSalary = 0
        companyBudgetLabel.text = String("Budget:") + String(budget) //Interpolation
    }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        if let income = Int(enterpriceTF.text ?? "") {
            budget += income
            companyBudgetLabel.text = "Budget: " + String(budget)
            self.view.makeToast("Income is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        if let outcome = Int(enterpriceTF.text ?? "") {
            budget -= outcome
            companyBudgetLabel.text = "Budget: " + String(budget)
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addWorkerButtonPressed(_ sender: Any) {
        if enterNameTF.text != "" && enterAgeTF.text != "" && enterJobPositionTF.text != "" {
            if enterJobPositionTF.text == "Director"{
                let newEmployee = Director()
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                newEmployee.name = enterNameTF.text ?? ""
                myCompany.workers.append(newEmployee)
                numberOfWorkerLabel.text = "Number of workers:" + String(myCompany.workers.count)
                self.view.makeToast("New worker is added!", duration: 2.0, position: .center)
            }
            else if enterJobPositionTF.text == "Assistant"{
            let newEmployee = Assistant()
            newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
            newEmployee.name = enterNameTF.text ?? ""
            numberOfWorkerLabel.text = "Number of workers:" + String(myCompany.workers.count)
            myCompany.workers.append(newEmployee)
            self.view.makeToast("New worker is added!", duration: 2.0, position: .center)
            }
            else{
            self.view.makeToast("Please fill correct!", duration: 2.5, position: .center)
            }
        }
        else{
        self.view.makeToast("Please fill all fields!", duration: 2.5, position: .center)
        }
    }
    
    @IBAction func enterpriceTFFilled(_ sender: Any) {
    }
}

// SALARY CALCULATIONS
class CompanyP {
    var workers: [EmployeeP] = []
}

protocol CostProtocol {
    func getCost() -> Int
}

class EmployeeP: CostProtocol {
    var age: Int = 0
    var name: String = ""
    var cost: Int = 0
    func getCost() -> Int{
        return 10000
    }
}

class Assistant: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 100
    }
}

class Director: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 200
    }
}



    

