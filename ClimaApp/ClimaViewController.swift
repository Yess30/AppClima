//
//  ViewController.swift
//  ClimaApp
//
//  Created by marco rodriguez on 01/04/21.
//

import UIKit

class ClimaViewController: UIViewController,UITextFieldDelegate,ClimaManagerDelegado {
    
    var climaManager = ClimaManager();
    
    
    
    
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var condicionClimaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var feels: UILabel!
    @IBOutlet weak var humedad: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        climaManager.delegado = self
        buscarTextField.delegate = self
    }
    
    

    @IBAction func buscarBoton(_ sender: UIButton) {
        buscarTextField.endEditing(true)
        
        print(buscarTextField.text!)
        
        ciudadLabel.text = buscarTextField.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buscarTextField.endEditing(true)
        print(buscarTextField.text!)
        ciudadLabel.text = buscarTextField.text!
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if buscarTextField.text != ""{
            return true
        }else{
            buscarTextField.placeholder = "escribe algo "
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaManager.buscarClima(ciudad: buscarTextField.text!)
        ciudadLabel.text = buscarTextField.text!
        buscarTextField.text=""
    }
    
    func actualizarClima(clima: ClimaModelo){
        DispatchQueue.main.async {
            self.ciudadLabel.text = clima.ciudad
            self.temperaturaLabel.text = clima.tempString
            self.condicionClimaImageView.image = UIImage(systemName: clima.CondicionClima)
            self.feels.text = clima.feelsString
            self.humedad.text = clima.humedadString	
        }
    }

    
    
    
    


}

