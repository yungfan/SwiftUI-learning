//
//  ContentView.swift
//  Modifier10-Material
//
//  Created by 杨帆 on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(.ultraThickMaterial)
        }
        
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(.thickMaterial)
        }
        
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(.regularMaterial)
        }
        
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(.thinMaterial)
        }
        
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(.ultraThinMaterial)
        }
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
