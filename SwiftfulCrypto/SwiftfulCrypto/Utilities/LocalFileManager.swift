//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 18/06/22.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        createFolder(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getImageUrl(imageName: imageName, folderName: folderName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getImageUrl(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolder(folderName: String) {
        guard let url = getFolderUrl(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    private func getFolderUrl(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getImageUrl(imageName: String, folderName: String) -> URL? {
        guard let folder = getFolderUrl(folderName: folderName) else { return nil }
        return folder.appendingPathComponent(imageName)
    }
}
