//
//  ImagerSaver.swift
//  Instafilter
//
//  Created by Pranesh Ambokar on 1/4/21.
//

import UIKit

class ImageSaver: NSObject { //saves pics
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) { //did this in previous videos
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error { //handles errors and passes them to content view
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
