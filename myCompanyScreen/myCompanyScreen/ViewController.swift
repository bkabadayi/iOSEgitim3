//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 17.12.2020.
//

import UIKit
import Toast
class ViewController: UIViewController, SecondViewControllerDelegate {
    
    //Buttons
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    @IBOutlet weak var addWorkerButton: UIButton!
    //Labels
    @IBOutlet weak var compNameLabel: UILabel!
    @IBOutlet weak var numberOfWorkerLabel: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!
    //TextFields
    @IBOutlet weak var enterpriceTF: UITextField!
    
    var budget = 0
    var totalSalary = 0
    let myCompany = CompanyP()
    let ahmet = Director()
    let berkin = Assistant()
    let baris = Assistant()
    let kaan = Director()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ahmet.name = "Ahmet"
        ahmet.age = 28
        
        berkin.name = "Berkin"
        berkin.age = 25
        
        baris.name = "Barış"
        baris.age = 22
        
        kaan.name = "Kaan"
        kaan.age = 28
        
        myCompany.workers.append(ahmet)
        myCompany.workers.append(berkin)
        myCompany.workers.append(baris)
        myCompany.workers.append(kaan)
        
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
        if let outcome = Int(enterpriceTF.text ?? "")  {
            budget -= outcome
            companyBudgetLabel.text = "Budget: " + String(budget)
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addWorkerButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func enterpriceTFFilled(_ sender: Any) {
    }
    
    
    // SecondViewControllerDelegate
    func appendNewEmployee(newEmployee: EmployeeP) {
        myCompany.workers.append(newEmployee)
        numberOfWorkerLabel.text = "Number of worker: \(myCompany.workers.count)"
    }
}
