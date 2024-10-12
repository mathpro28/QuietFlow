//
//  WeekdaysView.swift
//  QuietFlow
//
//  Created by Mateo Mercado on 11/10/24.
//

import SwiftUI

struct WeekdaysView: View {
    @State var selectedDays: [String] = []
    
    // Days of the week grouped into rows
    let weekdaysGrid: [[String]] = [
        ["Monday", "Tuesday"],     // Row 1
        ["Wednesday", "Thursday"], // Row 2
        ["Friday", "Saturday", "Sunday"] // Row 3
    ]
    
    var body: some View {
        VStack {
            ForEach(weekdaysGrid, id: \.self) { row in
                HStack(spacing: 8) { // Reduce horizontal spacing between buttons
                    ForEach(row, id: \.self) { day in
                        Button(day) {
                            if selectedDays.contains(day) {
                                selectedDays.removeAll { $0 == day }
                            } else {
                                selectedDays.append(day)
                            }
                        }
                        .buttonStyle(.bordered)
                        .tint(selectedDays.contains(day) ? .blue : .gray)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    WeekdaysView()
}
