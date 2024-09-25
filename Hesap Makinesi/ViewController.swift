//
//  ViewController.swift
//  Hesap Makinesi
//
//  Created by Mehmet Faik Ayhan on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {

    var labelResultFirstNum: Double = 0
    var labelResultSecondNum: Double = 0
    var performingMath = false
    var operation = 0

    @IBOutlet weak var labelResult: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath {
            labelResult.text = String(sender.tag)
            labelResultSecondNum = Double(labelResult.text!)!
            performingMath = false
        } else {
            labelResult.text = labelResult.text == "0" ? String(sender.tag) : labelResult.text! + String(sender.tag)

        }
    }
    
    @IBAction func buttonOperator(_ sender: UIButton) {
        if labelResult.text != "" && sender.tag != 10 && sender.tag != 17 {
            labelResultFirstNum = Double(labelResult.text!)!
        
            
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 17 { // Eşittir tuşuna basılırsa
            if operation == 13 {
                labelResult.text = String(labelResultFirstNum / labelResultSecondNum)
            } else if operation == 14 {
                labelResult.text = String(labelResultFirstNum * labelResultSecondNum)
            } else if operation == 15 {
                labelResult.text = String(labelResultFirstNum - labelResultSecondNum)
            } else if operation == 16 {
                labelResult.text = String(labelResultFirstNum + labelResultSecondNum)
            }
        } else if sender.tag == 10 { // AC sıfırlama tuşu
            labelResult.text = "0"
            labelResultFirstNum = 0
            labelResultSecondNum = 0
            operation = 0
            performingMath = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.text = "0"
    }

}
