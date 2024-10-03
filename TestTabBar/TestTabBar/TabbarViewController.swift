//
//  TabbarViewController.swift
//  TestTabBar
//
//  Created by Minnie Nt on 27/9/2567 BE.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        
        firstViewController.tabBarItem.title = "First"
        secondViewController.tabBarItem.title = "Second"
        firstViewController.title = "First"
        secondViewController.title = "Second"
        
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        // Add them to the tab bar controller
        setViewControllers([firstNavigationController, secondNavigationController], animated: true)
        
        // Customize Tab Bar
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        tabBarController?.setTabBarHidden(true, animated: true)
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

class FirstViewController: UIViewController {
    
    lazy var uiview: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .blue
        return uiview
    }()
    
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
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
//        self.edgesForExtendedLayout = []
    }
    
    override func viewDidLoad() {
        tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "circle.fill"), selectedImage: UIImage(named: "otherImage.png"))
        navigationItem.title = "First Page"
        
        view.backgroundColor = .red
        view.addSubview(button)
        view.addSubview(uiview)
        
        uiview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            uiview.heightAnchor.constraint(equalToConstant: 50),
            uiview.leftAnchor.constraint(equalTo: view.leftAnchor),
            uiview.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        super.viewDidLoad()
        
        
    }
}

class SecondViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: false)
//        self.edgesForExtendedLayout = []
    }
    override func viewDidLoad() {
        tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "circle.fill"), selectedImage: UIImage(named: "otherImage.png"))
        navigationItem.title = "Second Page"
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        super.viewDidLoad()
        view.backgroundColor = .green
        
    }
}
