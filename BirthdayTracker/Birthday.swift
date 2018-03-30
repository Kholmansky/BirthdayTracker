//
//  Birthday.swift
//  BirthdayTracker
//
//  Created by IOS developer on 30/03/2018.
//  Copyright © 2018 Maxim. All rights reserved.
//

import Foundation

class Birthday {
	
	let firstName : String
	let lastName : String
	let birthdate : Date
	
	init(firstName : String, lastName : String, birthdate : Date) {
		self.firstName = firstName
		self.lastName = lastName
		self.birthdate = birthdate
		
	}
}
