//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by IOS developer on 30/03/2018.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit

protocol AddBirthdayViewVontrollerDelegate {
    func addBirthdayViewController(_ addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday)
}

class AddBirthdayViewController: UIViewController {
	
	@IBOutlet var firstNameTextField: UITextField!
	@IBOutlet var lastNameTextField: UITextField!
	@IBOutlet var birthdatePicker: UIDatePicker!
    
    var delegate: AddBirthdayViewVontrollerDelegate?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		birthdatePicker.maximumDate = Date()
	}
	
	@IBAction func saveTapped(_ sender: UIBarButtonItem) {
		print ("Save button tapped.")
		
		let firstName = firstNameTextField.text ?? ""
		let lastName = lastNameTextField.text ?? ""
		let birthdate = birthdatePicker.date
		
		let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthdate: birthdate)
		
		print("Created an entry about birthday!")
		print("Firt Name: \(newBirthday.firstName)")
		print ("Last Name: \(newBirthday.lastName)")
		print("Birthday: \(newBirthday.birthdate)")
        
        delegate?.addBirthdayViewController(self, didAddBirthday: newBirthday)
        dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}


}

