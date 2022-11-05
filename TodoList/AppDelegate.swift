//
//  AppDelegate.swift
//  TodoList
//
//  Created by Илья Лясин
//

import UIKit
import RealmSwift

 @main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error.localizedDescription)")
        }
        return true
    } 
}
