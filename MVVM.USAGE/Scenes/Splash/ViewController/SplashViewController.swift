//
//  SplashViewController.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit

final class SplashViewController: UIViewController {
    private weak var coordinator: Coordinator?
    private let mainView: ListViewProtocol
    private let viewModel: ViewModel

    init(_ coordinator: Coordinator, viewModel: ViewModel) {
        self.mainView = ListView()
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.list.dataSource = self
        mainView.confirm = {
            fatalError()
        }

        mainView.cancel = {
            fatalError()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observers()
    }

    private func observers() {
        viewModel.users.bind { _ in self.mainView.list.reloadData() }
    }
}

extension SplashViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Value1")
        if let index = viewModel.users.value[indexPath.row] {
            cell.textLabel?.text = index.name
            cell.detailTextLabel?.text = String("ID: \(index.id)")
        }

        return cell
    }
}
