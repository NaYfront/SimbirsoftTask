//
//  DetailViewController.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

extension DetailViewController: DetailViewProtocol {
    func configure() {
        nameLabel.text = self.presenter.task.name
        descriptionLabel.text = self.presenter.task.specification
        dateLabel.text = self.presenter.convertDate()
    }
}
