//
//  ImageDownloader.swift
//  Movies app
//
//  Created by ZhZinekenov on 26.07.2023.
//

import Foundation
import UIKit

class ImageDownloader {
    static func getImageFromURL(_ imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        let session = URLSession.shared

        // Create a data task with the imageURL
        let task = session.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            // Convert the downloaded data into a UIImage
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }

        // Start the data task to initiate the download
        task.resume()
    }
}
