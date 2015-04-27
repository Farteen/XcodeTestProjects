//
//  AppDelegate.swift
//  ObjcNullability
//
//  Created by Bryan Luby on 4/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let anInstance = TestClass()

        // Will crash!
        let aString: String = anInstance.aMethodThatReturnsANonnullString()

        // Correctly triggers a build error
        anInstance.aMethodThatTakesNonnullParameter(nil)

        return true
    }


}

