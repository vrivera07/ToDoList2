//
// NewToDo.swift
// ToDoList
//
// Created by Scholar on 8/8/25.
//
import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
      var body: some View {
        VStack {
          HStack{
            Text("To Do List")
              .font(.system(size: 40))
              .fontWeight(.bold)
            Spacer()//push left or right
            Button{
              withAnimation{
                showNewTask = true
              }
            } label: {
              Text("+")
                .font(.title)
                .fontWeight(.bold)
            }
          }//end of the HStack
          .padding()
          Spacer()//push up
          List{//Displays list of tasks
            ForEach (toDos) { toDoItem in
              if toDoItem.isImportant {
                Text("‼️" + toDoItem.title)
              } else {
                Text(toDoItem.title)
              }
            }
          }
          .listStyle(.plain)
        }//end of the VStack
        if showNewTask {
          NewToDo(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
      }
    }
    #Preview {
      ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
    }
