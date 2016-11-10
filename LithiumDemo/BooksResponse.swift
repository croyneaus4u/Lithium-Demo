//
//  BooksResponse.swift
//  LithiumDemo
//
//  Created by Lab kumar on 08/11/16.
//  Copyright © 2016 Lab kumar. All rights reserved.
//

import Foundation

class JSONResponse: JSONDeserializable {
    required init(dictionary: [String : AnyObject]) {
        //
    }
}

class Book: JSONResponse {
    
    var bookURL: String?
    var name: String?
    var isbn: String?
    var authors: [String]?
    var numberOfPages: Int = 0
    var publisher: String?
    var country: String?
    var mediaType: String?
    var released: String?

    required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        bookURL <-- dictionary["url"]
        name <-- dictionary["name"]
        isbn <-- dictionary["isbn"]
        authors <-- dictionary["authors"]
        numberOfPages <-- dictionary["numberOfPages"]
        publisher <-- dictionary["publisher"]
        country <-- dictionary["country"]
        mediaType <-- dictionary["mediaType"]
        released <-- dictionary["released"]
    }
    
    func authorsName () -> String? {
        return authors?.joinWithSeparator(", ")
    }
    
    func releasedDate () -> String {
        return prettyDateStringFromString(released, fromFormat: nil, toFormat: nil)
    }
    
    func firstLetter () -> String {
        if let char = name?.characters.first {
            return "\(char)".uppercaseString
        }
        
        return "BOOK"
    }

}
