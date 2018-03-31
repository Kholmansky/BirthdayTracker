//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by IOS developer on 30/03/2018.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

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
		
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate
        newBirthday.birthdayId = UUID().uuidString
        
        if let uniqueId = newBirthday.birthdayId {
            print("birthdayId:\(uniqueId)")
        }
        
        do {
            try context.save()
            let message = "Today \(firstName) \(lastName) celebrating a birthday"
            let content = UNMutableNotificationContent()
            content.body = message
            content.sound = UNNotificationSound.default()
            var dateComponents = Calendar.current.dateComponents([.month, .day], from: birthdate)
            dateComponents.hour = 8
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            if let identifier = newBirthday.birthdayId {
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
                center.add(request, withCompletionHandler: nil)
            }
        } catch let error{
            print("Failed to save due the error: \(error)")
        }
        
        dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}


}

