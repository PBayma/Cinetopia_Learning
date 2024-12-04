//
//  ViewController.swift
//  Cinetopia
//
//  Created by Pedro Bayma on 02/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: .logo)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let image = UIImageView(image: .couple)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .buttonBackground
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.background, for: .normal)
        button.setTitle("Quero começar!", for: .normal)
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [logoImageView, coupleImageView, titleLabel, startButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.background
        
        addSubviews()
        setupConstraints()
        title = "Home"
    }
    
    @objc private func buttonPressed(){
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    
    private func addSubviews(){
        view.addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            
            startButton.heightAnchor.constraint(equalToConstant: 64),
            startButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
            startButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64),
            
            /*logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            coupleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: coupleImageView.bottomAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            
            
            */
        ])
    }
}

