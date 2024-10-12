//
//  NewActivityView.swift
//  QuietFlow
//
//  Created by Mateo Mercado on 11/10/24.
//

import SwiftUI

struct NewActivityView: View {
    @State var activityName: String = ""
    @State var activityDescription: String = ""
    @State var activityLocation: String = ""
    
    @State var activityStartTime: Date = Date()
    @State var activityEndTime: Date = Date()
    
    @State var weekdays: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var activityDays: [String] = []
    
    var body: some View {
        Form {
            Section("Choose Activity Name") {
                TextField("Activity Name", text: $activityName)
            }

            Section("Choose Activity Time") {
                DatePicker("Activity Start Time", selection: $activityStartTime, displayedComponents: .hourAndMinute)
                DatePicker("Activity End Time", selection: $activityEndTime, displayedComponents: .hourAndMinute)
            }
            
            Section("Choose Activity Days") {
                WeekdaysView()
            }
                
            Section("Choose Activity Date") {
                DatePicker("Activity Start Date", selection: $activityStartTime, displayedComponents: .date)
                DatePicker("Activity End Date", selection: $activityEndTime, displayedComponents: .date)
            }
        }
    }
}

#Preview {
    NewActivityView()
}
