//
//  ContentView.swift
//  UndoAndRedo
//
//  Created by 杨帆 on 2022/4/15.
//

import SwiftUI

struct ContentView: View {
    // undoManager
    @Environment(\.undoManager) var undoManager
    // 监听
    private let undoObserver = NotificationCenter.default.publisher(for: .NSUndoManagerCheckpoint)
    @State private var canUndo = false
    @State private var canRedo = false
    @State private var input = ""

    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()

            VStack {
                TextEditor(text: $input)

                HStack {
                    Button(
                        action: { undoManager?.undo() },
                        label: { Text("Undo") }
                    )
                    .disabled(!canUndo)
                    .onReceive(undoObserver) { _ in
                        self.canUndo = self.undoManager!.canUndo
                        self.canRedo = self.undoManager!.canRedo
                    }

                    Button(
                        action: { undoManager?.redo() },
                        label: { Text("Redo") }
                    )
                    .disabled(!canRedo)
                }
            }
            .padding()
            .navigationTitle("UndoAndRedo")
        }
        .frame(minWidth: 700,
               idealWidth: 1000,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
