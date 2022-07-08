//
//  MainViewController.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var calendarDatePicker: UIDatePicker!
    @IBOutlet weak var mainTableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(addTapped))
        
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
    
    @objc func addTapped() {
        presenter.tapOnPlusButton()
    }
    
    @IBAction func calendarChanged(_ sender: UIDatePicker) {
        presenter.dateChanged(date: sender.date)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tasks = presenter.tasksTable?.sections[section].tasks else { return 0 }
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.tasksTable?.sections[section].time
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let task = presenter.tasksTable?.sections[indexPath.section].tasks?[indexPath.row] else {
            fatalError("Something went wrong")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = task.name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tasksTable = presenter.tasksTable else { return 0 }
        return tasksTable.sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let task = presenter.tasksTable?.sections[indexPath.section].tasks?[indexPath.row] else { return }
        presenter.tapOnTask(task: task)
    }
}

extension MainViewController: MainViewProtocol {
    
}
