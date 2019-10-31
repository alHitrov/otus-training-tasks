//
//  AppDelegate.swift
//  LessonOne
//
//  Created by Alexey on 12/09/2019.
//  Copyright © 2019 GETMOBIT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	// Application launch
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		print(#function)
		
		return true
	}
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		print(#function)
		
		return true
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		print(#function)
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		print(#function)
	}


//	#pragma mark Application will/did Terminate
	func applicationWillResignActive(_ application: UIApplication) {
		print(#function)
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		print(#function)
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		print(#function)
	}
	
	

}

