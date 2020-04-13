//
//  PoetStore.swift
//  SwiftUI-Poet
//
//  Created by 杨帆 on 2020/4/13.
//  Copyright © 2020 杨帆. All rights reserved.
//

import UIKit


extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let model = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return model
    }
}



class PoetryStore: ObservableObject {
    
    @Published var poetries: [PoetryModel] = []
    
    init() {
        poetries = Bundle.main.decode([PoetryModel].self, from: "poetry.json")
    }
}
