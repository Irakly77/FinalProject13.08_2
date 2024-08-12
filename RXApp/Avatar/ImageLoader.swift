//
//  ImageLoader.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private static var cache = NSCache<NSURL, UIImage>()
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        if let cachedImage = ImageLoader.cache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] image in
                if let image = image {
                    ImageLoader.cache.setObject(image, forKey: url as NSURL)
                }
            })
            .assign(to: \.image, on: self)
    }
}

