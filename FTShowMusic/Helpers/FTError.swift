//
//  FTError.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

/// A helper enumeration that returns user-friendly error messages according to the cause of the error. These messages are to be displayed in an Alert.
enum FTError: String, Error {
    
    /// The URL was invalid
    case invalidUrl = "The URL was invalid. Please contact Showpad to obtain a new one."
    
    /// The response received was invalid
    case invalidResponse = "It's not you. It's us. Please, try again."
    
    /// The data received was invalid
    case invalidData = "Something is wrong with the data received. Please, try again."
    
    /// Could not complete the request
    case unableToComplete = "Something went wrong. Please try again."
}
