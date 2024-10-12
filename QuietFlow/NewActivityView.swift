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
    
    // Separate Date variables for time and date
    @State var activityStartTime: Date = Date()
    @State var activityEndTime: Date = Date()
    
    @State var activityStartDate: Date = Date()
    @State var activityEndDate: Date = Date()
    
    var body: some View {
        NavigationView { // Add a navigation view for sheet context
            Form {
                // Activity Name Section
                Section(header: Text("Activity Details")) {
                    TextField("Enter activity name", text: $activityName)
                        .padding(.vertical, 5)
                    TextField("Enter activity location", text: $activityLocation)
                        .padding(.vertical, 5)
                    TextField("Enter activity description", text: $activityDescription)
                        .padding(.vertical, 5)
                }

                // Time Section
                Section(header: Text("Activity Time")) {
                    DatePicker("Start Time", selection: $activityStartTime, displayedComponents: .hourAndMinute)
                    DatePicker("End Time", selection: $activityEndTime, displayedComponents: .hourAndMinute)
                }
                
                // Days Section
                Section(header: Text("Repeat On")) {
                    WeekdaysView() // Use your WeekdaysView for selecting days
                        .frame(alignment: .center)
                }

                // Date Section
                Section(header: Text("Activity Dates")) {
                    DatePicker("Start Date", selection: $activityStartDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $activityEndDate, displayedComponents: .date)
                }
            }
            .navigationTitle("New Activity") // Add a title
            .navigationBarTitleDisplayMode(.inline) // Display title inline for better compactness
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Action to save the activity
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        // Action to dismiss the sheet
                    }
                }
            }
        }
    }
}

#Preview {
    NewActivityView()
}
