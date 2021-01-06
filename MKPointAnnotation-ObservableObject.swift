//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Pranesh Ambokar on 1/5/21.
//

import MapKit

extension MKPointAnnotation: ObservableObject { //for the annotation part of the coordinates
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unkown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
