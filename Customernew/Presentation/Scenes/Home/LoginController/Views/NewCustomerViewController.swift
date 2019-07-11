//
//  NewCustomerViewController.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

protocol NewCustomerViewControllerDelegate {
    func newCustomer(customer: Customer)
}

class NewCustomerViewController: UIViewController {

    var delegate:NewCustomerViewControllerDelegate?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView(){
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        birthdateTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewCustomerViewController.datePickerFromValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        self.delegate?.newCustomer(customer: Customer(name: nameTextField.text!, surname: surnameTextField.text!, age: ageTextField.text!, birthdate: birthdateTextField.text!))
        self.closeButtonPressed(sender)
    }

    
    @objc func datePickerFromValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthdateTextField.text = dateFormatter.string(from: sender.date)
        
    }
}
