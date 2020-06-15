//
//  ContentView.swift
//  LocalNotificationsTest
//
//  Created by Patrik Svensson on 15/06/2020.
//  Copyright © 2020 Patrik Svensson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    func displayNotification() -> Void {
        print("Display Notification")
        
        let userNotificationCenter = UNUserNotificationCenter.current()
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test Local Notification"
        notificationContent.body = "This is a local notification triggered from the app itself"
        notificationContent.badge = NSNumber(value: 3)
        
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: nil)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Notification Test")
            Button(action: { self.displayNotification() }) {
                Text("Display Notification")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
