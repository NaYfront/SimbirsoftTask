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
        
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = Task(name: "name", description: "description", timeStart: Date(), timeFinish: Date())
        presenter.tapOnTask(task: task)
    }
}

extension MainViewController: MainViewProtocol {
    
}
