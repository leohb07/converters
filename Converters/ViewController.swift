//
//  ViewController.swift
//  Converters
//
//  Created by Leonardo Henrique Barrocal on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBOutlet weak var unitOneButton: UIButton!
    @IBOutlet weak var unitTwoButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultUnitLabel: UILabel!
    @IBOutlet weak var typeConvetionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedShowNextButton(_ sender: UIButton) {
        switch typeConvetionLabel.text! {
            case "Temperatura":
                typeConvetionLabel.text = "Peso"
                unitOneButton.setTitle("Kilograma", for: .normal)
                unitTwoButton.setTitle("Libra", for: .normal)
                
            case "Peso":
                typeConvetionLabel.text = "Moeda"
                unitOneButton.setTitle("Real", for: .normal)
                unitTwoButton.setTitle("Dolar", for: .normal)
                
            case "Moeda":
                typeConvetionLabel.text = "Distancia"
                unitOneButton.setTitle("Metro", for: .normal)
                unitTwoButton.setTitle("Kilometro", for: .normal)
                
            default:
                typeConvetionLabel.text = "Temperatura"
                unitOneButton.setTitle("Celsius", for: .normal)
                unitTwoButton.setTitle("Farenheint", for: .normal)
        }
        tappedConvertButton(nil)
    }
    
    
    @IBAction func tappedConvertButton(_ sender: UIButton?) {
        if let sender = sender { // desembrulhando um optinal com seguranca
            if sender == unitOneButton {
                unitTwoButton.alpha = 0.5
            } else {
                unitOneButton.alpha = 0.5
            }
            
            sender.alpha = 1.0
        }
        
        switch typeConvetionLabel.text! {
            case "Temperatura":
                calcTemperature()
                
            case "Peso":
                calcWeight()
                
            case "Moeda":
                calcCurrency()
                
            default:
                calcDistance()
        }
        
        view.endEditing(true) // forcar o teclado a ser minimizado
        let result = Double(resultLabel.text!)! // pegando o valor do resultado
        resultLabel.text = String(format: "%.2f", result) // formatando o valor
    }
    
    func calcTemperature() {
        // Utilizado guard let para utilizar a variavel novamente
        guard let temperature = Double(valueTextField.text!) else {return}
        
        if unitOneButton.alpha == 1.0 {
            resultUnitLabel.text = "Farenheint"
            resultLabel.text = String(temperature * 1.8 + 32.0)
        } else {
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temperature - 32.00) / 1.8)
        }
    }
    
    func calcWeight() {
        // Utilizado guard let para utilizar a variavel novamente
        guard let weight = Double(valueTextField.text!) else {return}
        
        if unitOneButton.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weight / 2.2046)
        } else {
            resultUnitLabel.text = "Kilograma"
            resultLabel.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        // Utilizado guard let para utilizar a variavel novamente
        guard let currency = Double(valueTextField.text!) else {return}
        
        if unitOneButton.alpha == 1.0 {
            resultUnitLabel.text = "Dolar"
            resultLabel.text = String(currency / 5.14)
        } else {
            resultUnitLabel.text = "Real"
            resultLabel.text = String(currency * 5.14)
        }
    }
    
    func calcDistance() {
        // Utilizado guard let para utilizar a variavel novamente
        guard let distance = Double(valueTextField.text!) else {return}
        
        if unitOneButton.alpha == 1.0 {
            resultUnitLabel.text = "Kilometro"
            resultLabel.text = String(distance / 1000.0)
        } else {
            resultUnitLabel.text = "Metros"
            resultLabel.text = String(distance * 1000.0)
        }
    }
}

