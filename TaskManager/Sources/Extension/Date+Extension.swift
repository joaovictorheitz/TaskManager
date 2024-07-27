//
//  Date+Extension.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 09/07/24.
//

import Foundation

extension Date {
    func toSimpleHourMinute() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let hourString = formatter.string(from: self)
        
        return hourString
    }

    func toSimpleDate() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let componentsSet: Set<Calendar.Component> = [.year, .month, .day]
        let components = calendar.dateComponents(componentsSet, from: self)
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.calendar = calendar
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if calendar.isDateInYesterday(self) {
            return TaskManagerStrings.yesterday
        } else if calendar.isDateInToday(self) {
            return TaskManagerStrings.today
        } else if calendar.isDateInTomorrow(self) {
            return TaskManagerStrings.tomorrow
        } else {
            let day = components.day!
            let monthNumber = components.month!
            formatter.dateFormat = "MMMM"
            let month = formatter.monthSymbols[monthNumber - 1]
            
            return "\(day) \(month)"
        }
    }
}
