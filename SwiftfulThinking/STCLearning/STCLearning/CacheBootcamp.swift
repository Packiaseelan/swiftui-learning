//
//  CacheBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 08/06/22.
//

import SwiftUI

class CacheManager {
    static var instance = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
       let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(name: String, image: UIImage) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache!"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage?
    @Published var cachedImage: UIImage?
    @Published var infoMessage: String = ""
    let imageName: String = "steve-jobs"
    
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCahce() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(name: imageName, image: image)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        if let image = manager.get(name: imageName) {
            cachedImage = image
            infoMessage = "Got image form cache!"
        } else {
            infoMessage = "no image."
            cachedImage = nil
        }
    }
}

struct CacheBootcamp: View {
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        VStack {
            if let image = vm.startingImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            
            Text(vm.infoMessage)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.purple)
            
            HStack {
                Button("Save to Cache") {
                    vm.saveToCahce()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Delete from Cache") {
                    vm.removeFromCache()
                }
                .accentColor(.red)
                .buttonStyle(.borderedProminent)
            }
            
            Button("Get from Cache") {
                vm.getFromCache()
            }
            .accentColor(.green)
            .buttonStyle(.borderedProminent)
            
            if let image = vm.cachedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationTitle("Cache")
    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
