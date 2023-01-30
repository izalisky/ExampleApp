//
//  UIImageViewExtension.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 22.11.2022.
//

import UIKit
import CoreImage

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(fromUrl url: URL) {
        let key = (url.absoluteString as NSString).lastPathComponent as NSString
        if let image = imageCache.object(forKey: key){
            self.image = image
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                imageCache.setObject(image, forKey: key)
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
    }
}
