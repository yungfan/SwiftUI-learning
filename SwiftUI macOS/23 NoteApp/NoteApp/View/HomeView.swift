//
//  HomeView.swift
//  NoteApp
//
//  Created by 杨帆 on 2023/10/25.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @State private var selectedTag = "All Notes"
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \NoteCategory.categoryTitle, animation: .snappy) private var categories: [NoteCategory]
    // Add
    @State private var addCategory = false
    @State private var categoryTitle = ""
    // Rename
    @State private var renameCategory = false
    @State private var selectedCategory: NoteCategory?
    // Delete
    @State private var deleteCategory = false
    @State private var isDark = false

    var body: some View {
        NavigationSplitView {
            // 左侧Siderbar
            List(selection: $selectedTag) {
                Text("All Notes")
                    .tag("All Notes")
                    .foregroundStyle(selectedTag == "All Notes" ? Color.primary : .gray)

                Text("Favourites")
                    .tag("Favourites")
                    .foregroundStyle(selectedTag == "Favourites" ? Color.primary : .gray)

                Section {
                    ForEach(categories) { category in
                        Text(category.categoryTitle)
                            .tag(category.categoryTitle)
                            .foregroundStyle(selectedTag == category.categoryTitle ? Color.primary : .gray)
                            .contextMenu {
                                Button("Rename") {
                                    renameCategory = true
                                    categoryTitle = category.categoryTitle
                                    selectedCategory = category
                                }

                                Button("Delete") {
                                    deleteCategory = true
                                    selectedCategory = category
                                }
                            }
                    }
                } header: {
                    HStack(spacing: 10) {
                        Text("Categories")

                        Image(systemName: "plus")
                            .onTapGesture {
                                addCategory.toggle()
                            }
                    }
                }
            }
        } detail: {
            // 右侧内容
            NotesView(categoryTitle: selectedTag, allCategories: categories)
        }
        .navigationTitle(selectedTag)
        .alert("Add Category", isPresented: $addCategory) {
            TextField("Category Title", text: $categoryTitle)

            Button("Cancle", role: .cancel) {
                categoryTitle = ""
            }

            Button("Add") {
                let category = NoteCategory(categoryTitle: categoryTitle)
                modelContext.insert(category)
                categoryTitle = ""
            }
        }
        .alert("Rename Category", isPresented: $renameCategory) {
            TextField("Category Title", text: $categoryTitle)

            Button("Cancle", role: .cancel) {
                categoryTitle = ""
                selectedCategory = nil
            }

            Button("Rename") {
                if let selectedCategory {
                    selectedCategory.categoryTitle = categoryTitle
                    categoryTitle = ""
                    self.selectedCategory = nil
                }
            }
        }
        .alert("Are you sure to delete \(categoryTitle) category", isPresented: $deleteCategory) {
            Button("Cancle", role: .cancel) {
                categoryTitle = ""
                selectedCategory = nil
            }

            Button("Delete", role: .destructive) {
                if let selectedCategory {
                    modelContext.delete(selectedCategory)
                    categoryTitle = ""
                    self.selectedCategory = nil
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                HStack(spacing: 10) {
                    Button("", systemImage: "plus") {
                        let note = Note(content: "new note")
                        modelContext.insert(note)
                    }

                    Button("", systemImage: isDark ? "sun.min" : "moon") {
                        isDark.toggle()
                    }
                    .contentTransition(.symbolEffect(.replace))
                }
            }
        }
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

#Preview {
    HomeView()
}
