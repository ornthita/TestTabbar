//
//  TabbarViewController.swift
//  TestTabBar
//
//  Created by Minnie Nt on 27/9/2567 BE.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        
        firstViewController.tabBarItem.title = "First"
        secondViewController.tabBarItem.title = "Second"
        firstViewController.title = "First"
        secondViewController.title = "Second"
        
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)

        setViewControllers([firstNavigationController, secondNavigationController], animated: true)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
    }
}

class FirstViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Second", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)
        return button
    }()
    
    @objc func goToSecond() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "circle.fill"), selectedImage: UIImage(named: "otherImage.png"))
        navigationItem.title = "First Page"
        
        view.backgroundColor = .red
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

class SecondViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "circle.fill"), selectedImage: UIImage(named: "otherImage.png"))
        navigationItem.title = "Second Page"
        view.backgroundColor = .green
    }
}
