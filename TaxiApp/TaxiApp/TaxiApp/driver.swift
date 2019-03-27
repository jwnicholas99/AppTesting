//
//  Driver.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit

class driver {
    var photo : UIImage?
    var name : String
    var destination : String
    var rating : Int
    
    init?(photo : UIImage?, name : String, destination : String, rating : Int){
        if name.isEmpty || destination.isEmpty {
            return nil
        }
        
        self.photo = photo
        self.name = name
        self.destination = destination
        self.rating = rating
    }
}
