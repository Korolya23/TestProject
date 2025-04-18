//
//  imageLoader.swift
//  TestProject
//
//  Created by Artem on 18.04.25.
//

import UIKit

class ImageLoader {
    private let proccessingQueue = DispatchQueue(
        label: "image.proccessing.queue",
        qos: .userInitiated,
        attributes: .concurrent
    )
    
    private let maxConcurrentTasks: Int
    private let semaphore: DispatchSemaphore
    
    init(maxConcurrentTasks: Int = 3) {
        self.maxConcurrentTasks = maxConcurrentTasks
        self.semaphore = DispatchSemaphore(value: maxConcurrentTasks)
    }
    
    func loadImage(from data: Data, completion: @escaping (UIImage?) -> Void) {
        proccessingQueue.async { [weak self] in
            self?.semaphore.wait()
            
            let image = UIImage(data: data)
            
            self?.semaphore.signal()
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
