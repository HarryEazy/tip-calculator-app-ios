//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Harry Eazy on 17/12/2020.


import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitAmount = "2"
    var totalPricePP = "0.0"
    var tipAmount = "10%"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPricePP
        settingsLabel.text = "Split between \(splitAmount) people , \(tipAmount) tip."
        
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // go back to calculate VC by dismissing
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
