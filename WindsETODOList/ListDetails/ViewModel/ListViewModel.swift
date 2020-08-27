//
//  ListViewModel.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
class ListViewModel {
    
    var todoList: [ToDo]?
    var filtered: [ToDo]?
    var filterring = false
    
    //MARK: Check if List is Empty
    func isTodoListEmpty() -> Bool {
        return SharedResources.sharedResources.todoDetails.isEmpty
    }
    
    //MARK: Add TODO List
    func addTodoList() {
        if let list = getTodoList() {
            SharedResources.sharedResources.todoDetails = list
            sortTodolist()
        }
    }
    
    //MARK: Get TODO List
    func getTodoList() -> [ToDo]? {
        do {
            let data = try Data(contentsOf: AppConstants.plistURL)
            return try PropertyListDecoder().decode([ToDo].self, from: data)
        } catch {
            // Handle error
            return nil
        }
    }
    
    //MARK: Sort TODO List
    func sortTodolist() {
        SharedResources.sharedResources.todoDetails = SharedResources.sharedResources.todoDetails.sorted(by:{ !$0.selected && $1.selected})
        todoList = SharedResources.sharedResources.todoDetails
    }
    
    //MARK: Select Checked TODO List
    func selectedCheckList(at position: Int) {
        var todoValues = SharedResources.sharedResources.todoDetails
        let selectedTodo = todoValues[position]
        let newTodo = ToDo(title: selectedTodo.title ?? "", description: selectedTodo.description ?? "", selected: true)
        todoValues.remove(at: position)
        todoValues.insert(newTodo, at: todoValues.count)
        SharedResources.sharedResources.todoDetails = todoValues
        sortTodolist()
        updateModel()
    }
    
    //MARK: Update Model
    func updateModel() {
        do {
            try PropertyListEncoder().encode(SharedResources.sharedResources.todoDetails).write(to: AppConstants.plistURL)
        } catch {
            print(error)
        }
    }
    
    //MARK: Get TODO List count
    func todosCount() -> Int {
        return self.filterring ? self.filtered?.count ?? 0 : todoList?.count ?? 0
    }
    
    //MARK: Get TODO Details
    func getTodoDetails(at position: Int) -> ToDo? {
        return self.filterring ? self.filtered?[position] : self.todoList?[position]
    }
    
}
