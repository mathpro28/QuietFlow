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
            Section {
                TextField("Activity Name", text: $activityName)
            }

            Section {
                DatePicker("Activity Start Time", selection: $activityStartTime, displayedComponents: .hourAndMinute)
                DatePicker("Activity End Time", selection: $activityEndTime, displayedComponents: .hourAndMinute)
            }
            
            Section(header: Text("Select Days")) {
                List {
                    ForEach(weekdays, id: \.self) { day in
                        MultipleSelectionRow(day: day, isSelected: activityDays.contains(day)) {
                            if activityDays.contains(day) {
                                activityDays.removeAll { $0 == day }
                            } else {
                                activityDays.append(day)
                            }
                        }
                    }
                }
            }
            
            Section {
                DatePicker("Activity Start Date", selection: $activityStartTime, displayedComponents: .date)
                DatePicker("Activity End Date", selection: $activityEndTime, displayedComponents: .date)
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var day: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(day)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    NewActivityView()
}
