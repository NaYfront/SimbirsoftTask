//
//  ExtensionDate.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 04.07.2022.
//

import Foundation

extension Date {
    func getDayComponents() -> DateComponents {
        return Calendar.current.dateComponents([.day, .month, .year], from: self)
    }
    
    static func correctFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return formatter.string(from: date)
    }
    
    static func changeDate(day: Date, time: Date) -> Date {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: day)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: day)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: day)
        
        formatter.dateFormat = "HH"
        let hours = formatter.string(from: time)
        formatter.dateFormat = "mm"
        let minutes = formatter.string(from: time)
        
        var dateComponents = DateComponents()
        
        dateComponents.timeZone = TimeZone(abbreviation: "MSK")

        dateComponents.year = Int(year) ?? 0
        dateComponents.month = Int(month) ?? 0
        dateComponents.day = Int(day) ?? 0
        
        dateComponents.hour = Int(hours) ?? 0
        dateComponents.minute = Int(minutes) ?? 0

        let calendar = Calendar(identifier: .gregorian)
        
        guard let newDate = calendar.date(from: dateComponents) else { return Date() }
        
        return newDate
    }
}

extension DateComponents: Comparable {
    static public func < (lhs: DateComponents, rhs: DateComponents) -> Bool {
        guard let lday = lhs.day, let lmonth = lhs.month, let lyear = lhs.year else { return false }
        guard let rday = rhs.day, let rmonth = rhs.month, let ryear = rhs.year else { return false }

        if lyear < ryear {
            return true
        } else if lyear == ryear {
            if lmonth < rmonth {
                return true
            } else if lmonth == rmonth {
                return lday < rday
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
