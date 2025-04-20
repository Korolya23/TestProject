//
//  Flashcard+Extentions.swift
//  TestProject
//
//  Created by Artem on 20.04.25.
//

import CoreData
import UIKit

extension Flashcard {
    var wrappedWord: String {
        word ?? ""
    }
    
    func getImage() -> UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}
