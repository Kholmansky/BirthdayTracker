//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by IOS developer on 30/03/2018.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit

class AddBirthdayViewController: UIViewController {
	
	@IBOutlet var firstNameTextField: UITextField!
	@IBOutlet var lastNameTextField: UITextField!
	@IBOutlet var birthdatePicker: UIDatePicker!

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
		print("Firt Name: \(firstName)")
		print ("Last Name: \(lastName)")
		print("Birthday: \(birthdate)")
	}
	
	@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}


}

