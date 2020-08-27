//
//  ViewController.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var listVM = ListViewModel()
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewNeeds()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addSerchBarNavigation()
        listVM.addTodoList()
        self.listTableView.reloadData()
    }
    
    //MARK: Apply Styles and Utilities
    func setTableViewNeeds() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableFooterView = UIView()
        listTableView.register(UINib(nibName: "ListShowCell", bundle: .main), forCellReuseIdentifier: "ListShowCell")
    }
    
    func addSerchBarNavigation() {
        title = "Todo's"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    //MARK: Go to Add TODO's Handler
    @objc func addTapped() {
        self.performSegue(withIdentifier: "addTodo", sender: self)
    }
}

extension ViewController:  UITableViewDataSource {
    //MARK: TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = listVM.todosCount()
        if numberOfSections == 0 {
            tableView.emptyMessage(message: "No Records Available")
            return numberOfSections
        }
        tableView.emptyMessage(message: "")
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListShowCell") as? ListShowCell else {return UITableViewCell()}
        cell.tag = indexPath.section
        cell.delegate = self
        cell.configureCell(details: listVM.getTodoDetails(at: indexPath.section))
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    //MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        footerView.backgroundColor = .white
        return footerView
    }
}

extension ViewController: UISearchResultsUpdating {
    //MARK: Search TODO List
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            self.listVM.filtered = self.listVM.todoList?.filter({ (todo) -> Bool in
                return (todo.title?.lowercased().contains(text.lowercased()) ?? false)
            })
            self.listVM.filterring = true
        }
        else {
            self.listVM.filterring = false
            self.listVM.filtered = [ToDo]()
        }
        self.listTableView.reloadData()
    }
}

extension ViewController: SelectCheckBoxDetails {
    //MARK: Select CheckBox
    func checkboxList(at position: Int) {
        self.listVM.selectedCheckList(at: position)
        self.listTableView.reloadData()
        
    }
}
