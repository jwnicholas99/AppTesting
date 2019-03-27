//
//  Driver.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit
import os.log

class driver: NSObject, NSCoding {
    var photo : UIImage?
    var name : String
    var destination : String
    var rating : Int
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let destination = "destination"
        static let rating = "rating"
    }
    
    init?(photo : UIImage?, name : String, destination : String, rating : Int){
        if name.isEmpty || destination.isEmpty {
            return nil
        }
        
        self.photo = photo
        self.name = name
        self.destination = destination
        self.rating = rating
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(destination, forKey: PropertyKey.destination)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the destination for a driver object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let destination = aDecoder.decodeObject(forKey: PropertyKey.destination) as? String else {
            os_log("Unable to decode the destination for a driver object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer.
        self.init(photo: photo, name: name, destination: destination, rating: rating)
        
    }
}
