//
//  NotesView.swift
//  NoteApp
//
//  Created by 杨帆 on 2023/10/25.
//

import SwiftData
import SwiftUI

struct NotesView: View {
    // 接收参数
    var categoryTitle: String?
    var allCategories: [NoteCategory]
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .snappy) private var notes: [Note]
    @FocusState private var isKeyboardEnable: Bool
    // Delete
    @State private var deleteNote = false
    @State private var selectedNote: Note?

    // 自定义过滤
    init(categoryTitle: String?, allCategories: [NoteCategory]) {
        self.categoryTitle = categoryTitle
        self.allCategories = allCategories
        let predicate = #Predicate<Note> {
            $0.category?.categoryTitle == categoryTitle
        }
        let favouritePredicate = #Predicate<Note> {
            $0.isFavourite
        }
        let finalPredicate = categoryTitle == "All Notes" ? nil : (categoryTitle == "Favourites" ? favouritePredicate : predicate)

        _notes = Query(filter: finalPredicate, sort: [], animation: .bouncy)
    }

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let width = size.width
            let rowCount = max(Int(width / 250), 1)

            ScrollView(.vertical) {
                // 动态计算count
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: rowCount), spacing: 10) {
                    ForEach(notes) { note in
                        NoteCardView(note: note, isKeyboardEnable: $isKeyboardEnable)
                            .contextMenu {
                                Button(note.isFavourite ? "Remove from Favourites" : "Add to Favourites") {
                                    note.isFavourite.toggle()
                                }

                                Menu {
                                    ForEach(allCategories) { category in
                                        Button {
                                            note.category = category
                                        } label: {
                                            HStack(spacing: 5) {
                                                if category == note.category {
                                                    Image(systemName: "checkmark")
                                                        .font(.caption)
                                                }

                                                Text(category.categoryTitle)
                                            }
                                        }
                                    }

                                    Button("Remove from category") {
                                        note.category = nil
                                    }

                                } label: {
                                    Text("Category")
                                }

                                if categoryTitle == "All Notes" {
                                    Button("Delete Note", role: .destructive) {
                                        selectedNote = note
                                        deleteNote.toggle()
                                    }
                                }
                            }
                    }
                }
                .padding(12)
            }
            .onTapGesture {
                isKeyboardEnable = false
            }
            .alert("Are you sure to delete this note", isPresented: $deleteNote) {
                Button("Cancle", role: .cancel) {
                    selectedNote = nil
                }

                Button("Delete", role: .destructive) {
                    if let selectedNote {
                        modelContext.delete(selectedNote)
                    }
                    selectedNote = nil
                }
            }
        }
    }
}

struct NoteCardView: View {
    @Bindable var note: Note
    var isKeyboardEnable: FocusState<Bool>.Binding
    @State private var showNotes = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)

            TextEditor(text: $note.content)
                .focused(isKeyboardEnable)
                .overlay(alignment: .leading) {
                    Text("New Note")
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                        .opacity(note.content.isEmpty ? 1 : 0)
                        .allowsTightening(false)
                }
                .scrollContentBackground(.hidden)
                .multilineTextAlignment(.leading)
                .padding(15)
                .kerning(1.2)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.15), in: .rect(cornerRadius: 12))
        }
        .onAppear {
            self.showNotes = true
        }
        .onDisappear {
            self.showNotes = false
        }
    }
}
