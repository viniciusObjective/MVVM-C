//
//  ListView.view.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit
import SnapKit

protocol ListViewProtocol where Self: UIView {
    var list: UITableView { get set }
    var confirm: Completion? { get set }
    var cancel: Completion? { get set }
}

final class ListView: UIView, ListViewProtocol {
    // MARK: - Components
    lazy var list: UITableView = {
        var stack = UITableView()
        return stack
    }()

    private lazy var tableHeader: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private lazy var buttonsContainer: UIStackView = {
        var stack = UIStackView()
        stack.backgroundColor = .cyan
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private lazy var confirmButton = makeButton(title: "CONFIRMA", background: .blue)
    private lazy var cancelButton = makeButton(title: "CANCELA", background: .red)

    // MARK: - Properties
    var confirm: Completion?
    var cancel: Completion?

    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        addViews()
        addConstraints()
        addActions()
        test()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Addawdawdaw")
    }

    // MARK: - Make methods
    private func makeButton(title: String, background: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = background
        return button
    }

    // MARK: - Common Methods
    private func addViews() {
        backgroundColor = .white
        addSubview(list)
        addSubview(buttonsContainer)
        addSubview(tableHeader)

        buttonsContainer.addArrangedSubview(confirmButton)
        buttonsContainer.addArrangedSubview(cancelButton)
    }

    private func test() {
        list.tableHeaderView = tableHeader
    }

    private func addConstraints() {
        list.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(buttonsContainer.snp.top)
        }

        buttonsContainer.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
        }

        tableHeader.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(list.snp.width)
        }
    }

    private func addActions() {
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func confirmAction() {
        if let confirm = confirm {
            confirm()
        }
    }

    @objc private func cancelAction() {
        if let cancel = cancel {
            cancel()
        }
    }
}
