//
//  BNRImageStore.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/5/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRImageStore: NSObject {
    static let sharedStore = BNRImageStore()
    private override init() { super.init() }
    
    private var dictionary = [String: UIImage]()
    
    func setImage(image: UIImage, forKey key: String) {
        dictionary[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        if let image = dictionary[key] {
            return image
        } else {
            return nil
        }
    }
    
    func deleteImageForKey(key: String) {
        let keyExists = dictionary[key] != nil
        if keyExists {
            dictionary.removeValueForKey(key)
        } else {
            print("No image by that name in storage")
        }
    }
    
}
