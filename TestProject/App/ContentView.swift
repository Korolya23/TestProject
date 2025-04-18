//
//  ContentView.swift
//  TestProject
//
//  Created by Artem on 12.04.25.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.body, ascending: true)],
        animation: .default)
    private var entities: FetchedResults<Entity>
    
    @State private var newBody: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите текст", text: $newBody)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: addEntity) {
                    Text("Добавить")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(entities) { entity in
                        VStack(alignment: .leading) {
                            Text("Текст: \(entity.body ?? "Нет данных")")
                            Text("ID: \(entity.id?.uuidString ?? "Нет ID")")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteEntity)
                }
            }
            .navigationTitle("Core Data Test")
        }
    }

    private func addEntity() {
        withAnimation {
            let newEntity = Entity(context: viewContext)
            newEntity.body = newBody
            newEntity.id = UUID()

            do {
                try viewContext.save()
            } catch {
                print("Ошибка сохранения: \(error.localizedDescription)")
            }
        }
    }

    private func deleteEntity(offsets: IndexSet) {
        withAnimation {
            offsets.map { entities[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                print("Ошибка удаления: \(error.localizedDescription)")
            }
        }
    }
}

