//
//  PresentationViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 07.10.2023.
//

import UIKit

struct Constant {
    static let imageName = "logo"
    static let titleText = "Для регистрации в личном кабинете Вам необходимо посетить пробное занятие"
    static let title = "Записаться на занятие"
}

final class PresentViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.imageName)?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel = UILabel(
        text: Constant.titleText,
        font: .systemFont(ofSize: 18, weight: .medium),
        textAlignment: .center,
        numberOfLines: 0
    )
    
    private lazy var presentButton = UIButton(text: Constant.title)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        setupViews()
        setupLayout()
        setupNavigationBar()
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        presentButton.addTarget(self, action: #selector(presentationButtonTapped), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(presentButton)
    }
    
    
    @objc private func presentationButtonTapped() {
        let authVC = AuthViewController()
        navigationController?.pushViewController(authVC, animated: true)
    }
}

extension PresentViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 78),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 40),
            presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}

//MARK: - SetupNavigationBar
extension PresentViewController {
    private func setupNavigationBar() {
        
        //navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .pinkColor()
        navigationController?.navigationBar.tintColor = .white
    }
}

