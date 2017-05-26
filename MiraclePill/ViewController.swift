//
//  ViewController.swift
//  MiraclePill
//
//  Created by Nick on 26.05.17.
//  Copyright © 2017 LagoikoNick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
 
    
    
    @IBOutlet weak var zipcodeLabel: UILabel!
    
//text fields
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var cityTextFiled: UITextField!
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    
    let states = ["Брэсцкая вобласць","Віцебская вобласць","Гомельская вобласць","Гродзенская вобласць","Мінская вобласць","Магілёўская вобласць"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statePicker.dataSource = self
        statePicker.delegate = self
        
        //textfields
        nameTextField.delegate = self
        adressTextField.delegate = self
        cityTextFiled.delegate = self
        countryTextField.delegate = self
        zipcodeTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        
        statePicker.isHidden = false
        
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        
        zipcodeLabel.isHidden = true
        zipcodeTextField.isHidden = true
        
        
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
   
    //функция didSelectRow - список со строками областей из массива
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        //прячем countryLabel и countryTextField
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        //прячем zipcodeLabel и zipcodeTextField
        zipcodeLabel.isHidden = false
        zipcodeTextField.isHidden = false
    }
    
    
    
    
    
    //Hide keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        adressTextField.resignFirstResponder()
        cityTextFiled.resignFirstResponder()
        countryTextField.resignFirstResponder()
        zipcodeTextField.resignFirstResponder()
        
        return (true)
    }
    
}
