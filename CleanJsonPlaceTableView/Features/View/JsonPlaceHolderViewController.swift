//
//  JsonPlaceHolderViewController.swift
//  CleanJsonPlaceTableView
//
//  Created by Mahmut Gazi Doğan on 30.11.2022.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {
    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!
    
    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPlaceHolderProtocol = JsonPlaceHolderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initService()
    }
    
    private func initDelegate() {
        tableViewJsonPlaceHolder.delegate = jsonTableView
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        jsonTableView.delegate = self
    }
    
    private func initService() {
        jsonService.fetchAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }

    }
    
}

extension JsonPlaceHolderViewController: JsonTableViewOutput {
    func onSelected(item: PostModel) {
        print(item.body ?? "")
    }
}
