//
//  LocalNotificationBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 16/05/22.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAnthorization() {
        let options: UNAuthorizationOptions = [.sound, .alert, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This is sub title"
        content.sound = .default
        content.badge = 3
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: getNotificationTrigger())
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func getNotificationTrigger() -> UNNotificationTrigger {
        // Time Trigger
        return UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Calendar Trigger
//        var dateComponents = DateComponents();
//        dateComponents.hour = 18
//        dateComponents.minute = 06
//        return UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Location Trigger
//        let coordinates = CLLocationCoordinate2D(latitude: 40.0, longitude: 50.0)
//        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//        return UNLocationNotificationTrigger( region: region, repeats: false)
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permissions") {
                NotificationManager.instance.requestAnthorization()
            }
            
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
