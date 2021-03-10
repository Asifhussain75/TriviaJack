//
//  Date.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation
extension Date {
    func getDateForLastYear(years: Int) -> Date? {
        return Calendar.current.date(byAdding: .year, value: -years, to: self)
    }
    func getDateForLast(months: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: -months, to: self)
    }
    func getLast3Day(day: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -day, to: self)
    }
     func getDiff(from: Date , to: Date)-> Int? {
        return Calendar.current.dateComponents([.day], from: from, to: to).day
    }
    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self) == self.compare(date2)
    }
    static func dateFromString(dateString : String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.000000"
        return dateFormatter.date(from: dateString)
    }
    static func stringFromDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MMM.yyyy"
        if let date = date {
            return dateFormatter.string(from: date)
        }
        return ""
    }
    static func stringFromDateDefault(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let date = date {
            return dateFormatter.string(from: date)
        }
        return ""
    }
     static func convertDateFormater(date: String) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
         if let date = dateFormatter.date(from: date){
             dateFormatter.dateFormat = "MMMM yyyy"
             return  dateFormatter.string(from: date)
         }
         return ""
     }
     static func convertDateFormaterForMedia(date: String) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
         if let date = dateFormatter.date(from: date){
             dateFormatter.dateFormat = "dd MMMM, yyyy"
             return  dateFormatter.string(from: date)
         }
         return ""
     }
    
      

     static func convertDateFormaterForCommentList(date: String) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
         if let date = dateFormatter.date(from: date){
             dateFormatter.dateFormat = "dd MMMM yyyy"
             return  dateFormatter.string(from: date)
         }
         return ""
     }
     
    
     
     
     static func getDateFromTimeStamp(timeStamp : Double?) -> String {
         if let time = timeStamp {
             let date = Date(timeIntervalSince1970: time / 1000)
             let dayTimePeriodFormatter = DateFormatter()
             dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
             // UnComment below to get only time
             //  dayTimePeriodFormatter.dateFormat = "hh:mm a"
             let dateString = dayTimePeriodFormatter.string(from: date as Date)
             return dateString
         }
         return ""
     }
    func toMillis() -> Double {
        return timeIntervalSince1970 * 1000
    }
}
