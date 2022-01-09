//
//  StorageHandler.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 08/01/2022.
//

import Foundation

public class StorageHandler {
    
    private init(){}
    
    public static func getURL(for directory: Directory) -> URL {
        let searchDirectory: FileManager.SearchPathDirectory
        switch directory {
        case .cache:
            searchDirectory = .cachesDirectory
        case .documents:
            searchDirectory = .documentDirectory
        }
        guard let url = FileManager.default.urls(for: searchDirectory, in: .userDomainMask).first else {
            fatalError("Failed to find valid directory")
        }
        return url
    }
    
    public static func clear( _ directory: Directory ) {
        let directoryURL = getURL(for: directory)
        do {
            let cachedFiles = try FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil, options: [])
            for fileURL in cachedFiles {
                try FileManager.default.removeItem(at: fileURL)
            }
        } catch let error {
            fatalError("\(error.localizedDescription)")
        }
    }
    
    public static func remove(fileName: String, in directory: Directory) {
        let fileStatus = fileExists(fileName: fileName, in: directory)
        if fileStatus.available {
            do {
                try FileManager.default.removeItem(at: fileStatus.fileURL)
            } catch let error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
    
    public static func fileExists(fileName: String, in directory: Directory) -> (available: Bool, fileURL: URL) {
        let fileURL = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        return (FileManager.default.fileExists(atPath: fileURL.path), fileURL)
    }
}


public enum Directory {
    case cache, documents
}
