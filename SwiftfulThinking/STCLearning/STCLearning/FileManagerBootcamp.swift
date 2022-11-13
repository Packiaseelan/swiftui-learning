//
//  FileManagerBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 06/06/22.
//

import SwiftUI

class LocalFileManager {
    static var instance: LocalFileManager = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        createFolder()
    }
    
    func createFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories:  true)
                print("Success creating  folder")
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1),
            let path = getImagePath(name: name) else {
            return "Error getting data."
        }
        
        do {
            try data.write(to: path)
            return "Success saving!"
        } catch let error {
            return "Error saving image. \(error)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getImagePath(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getImagePath(name: name),
            FileManager.default.fileExists(atPath: path.path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            return "Success deleting!"
        } catch let error {
            return "Error deleting file. \(error)"
        }
    }
    
    func getImagePath(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path.")
            return nil
        }
        
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage?
    let manager = LocalFileManager.instance
    let imageName: String = "steve-jobs"
    @Published var infomessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func deleteImage() {
        infomessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
    
    func saveImage() {
        guard let image = image else { return }
        infomessage = manager.saveImage(image: image, name: imageName)
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm  = FileManagerViewModel()
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            
            HStack {
                Button("Save to FM") {
                    vm.saveImage()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Delete from FM") {
                    vm.deleteImage()
                }
                .accentColor(.red)
                .buttonStyle(.borderedProminent)
            }
            
            Text(vm.infomessage)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.purple)
            
            
            Spacer()
        }
        .navigationTitle("File Manager")
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
