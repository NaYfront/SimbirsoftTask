//
//  CreateTaskViewController.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dayDatePicker: UIDatePicker!
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    
    var presenter: CreateTaskViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createTaskAction(_ sender: Any) {
        presenter.validate(name: nameTextField.text, timeStart: startTimeDatePicker.date, timeEnd: endTimeDatePicker.date)
    }
}

extension CreateTaskViewController: CreateTaskViewProtocol {
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
