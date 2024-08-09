import SwiftUI

/*
   Module 1 - Enums
 
   An enumeration defines a common type for a group of releated values and enables you to work
   with those values in a type-safe way within your code.
 
   Value based semantics
 
   Whenever you have something that requires custom types, or option, an enumeration is the perfect structure to use
 */

// MARK: - Standard Enum

enum ColorScheme {
  case light
  case dark
  case custom
  case system
}

var scheme: ColorScheme = .light

print("The background color is \(scheme)")

switch scheme {
case .light:
  print("The background color is light")
case .dark:
  print("The background color is dark")
case .custom, .system:
  print("The background color is either custom or system")
}


// MARK: - Enum Raw Values

enum Weekday: String {
  case monday = "M"
  case tuesday = "T"
  case wednesday = "W"
  case thursday = "Th"
  case friday = "F"
  case saturday = "Sa"
  case sunday = "Su"
}

let today = Weekday.monday

print("DEBUG: Today is \(today)")
print("DEBUG: Today is \(today.rawValue)")


enum APIStatusCode: Int {
  case success = 200
  case unauthorized = 401
  case notFound = 400
  case serverError = 500
}

let statusCode = APIStatusCode.serverError
print("DEBUG: Status Code \(statusCode.rawValue)")


// MARK: Associated Values & Computed Properties

enum OrderStatus {
  case processed
  case shipped(trackingID: String)
  case delivered
  
  var statusMessage: String {
    switch self {
    case .processed:
       return "Your order has been processed!"
    case .shipped(let trackingID):
      return "Your order is shipped and  tracking number is \(trackingID)"
    case .delivered:
      return " Your order is deliverd"
    }
  }
}

var status: OrderStatus = .processed
print(status.statusMessage)


status = .shipped(trackingID: NSUUID().uuidString)
print(status.statusMessage)


enum APIError {
  case success
  case jsonParseError(String)
  case invalidUrl(String)
  case invalidData
  
  var customMessage: String {
    switch self {
    case .success:
      return "Success"
    case .jsonParseError(let errorMessage):
       return "Unable to parse json response \(errorMessage)"
    case .invalidUrl(let message):
       return "Invalid URL \(message)"
    case .invalidData:
       return "Invalid Data"
    }
  }
}

enum NotificationType: Int, Codable {
   case like
   case comment
   case follow
  
  var notificationMessage: String {
    switch self {
    case .like: return " liked one for your posts."
    case .comment: return " commented on oneof your posts."
    case .follow: return " started following you."
    }
  }
}

//MARK : Enum With protocols

enum Color: CaseIterable {
  case red
  case yellow
  case blue
  case green
}

let allColors = Color.allCases

for color in allColors {
  print("Color is \(color)")
}
