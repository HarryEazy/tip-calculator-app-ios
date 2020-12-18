//
//  ViewController.swift
//  Tipsy
//


import UIKit




class CalculatorViewController: UIViewController {
    
    // textfield vars
    @IBOutlet weak var billTextField: UITextField!
    // button vars
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    // label vars
    @IBOutlet weak var splitLabel: UILabel!
    // tip amount and total price per person vars
    var tipAmount = 0.10
    var totalPricePP = "0.0"
    var tipPct = "10%"
    var splitAmount = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // the split value in string format
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        splitAmount = splitLabel?.text ?? "2"
        // check for optional and convert to Double type
        let splitAmount = Double (splitLabel?.text ?? "2")
        let billAmount = Double (billTextField?.text ?? "0.0")
        // get total price of bill + tip amount
        let totalPriceBill = billAmount! + (billAmount! * tipAmount)
        // get total price per person
        let totalPP = totalPriceBill / splitAmount!
        // convert totalPP to string and store in totalPricePP
        totalPricePP = String(format: "%.2f", totalPP)
        
//        print(totalPricePP)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    
    
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // deselect all buttons
        deselectAll()
        
        // check which button pressed and set tip amount and isSelected accordingly
        tipPct = sender.currentTitle!
        if tipPct == "0%" {
            zeroPctButton.isSelected = true
            tipAmount = 0.0
        } else if tipPct == "10%" {
            tenPctButton.isSelected = true
            tipAmount = 0.10
        } else {
            twentyPctButton.isSelected = true
            tipAmount = 0.20
        }
        // finish with keyboard
        billTextField.endEditing(true)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.splitAmount = self.splitAmount
                destinationVC.totalPricePP = self.totalPricePP
            destinationVC.tipAmount = self.tipPct
    }
    
    }
    
    // deselect all buttons 
    func deselectAll(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
       
    }



}

