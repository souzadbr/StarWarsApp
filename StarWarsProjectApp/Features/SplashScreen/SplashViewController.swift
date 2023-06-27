//
//  SplashViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 27/06/23.
//

import UIKit

class SplashViewController: UIViewController {
    
    // Declara a propriedade nameLabel
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 200, width: 200, height: 90)
        nameLabel.text = "Star..whats?!"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        
        // Crie uma visualização de animação
        let squareView = UIView(frame: CGRect(x: view.bounds.midX - 70, y: view.bounds.midY - 50, width: 150, height: 150))
        squareView.backgroundColor = .white
        squareView.layer.cornerRadius = 20.0
        view.addSubview(squareView)
        
        // Crie uma animação
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.duration = 5.0
        animation.repeatCount = .infinity
        animation.values = [0, Double.pi, 2 * Double.pi]
        squareView.layer.add(animation, forKey: "starAnimation")
        
        nameLabel.alpha = 0.0
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
            self.nameLabel.alpha = 1.0
        }, completion: nil)
        
        // Aguarde alguns segundos e, em seguida, vá para a próxima tela
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.navigateToNextScreen()
        }
    }
    
    func navigateToNextScreen() {
        // Vá para a próxima tela, a tela principal do seu aplicativo
        let homeScreenViewController = HomeScreenViewController()
        navigationController?.pushViewController(homeScreenViewController, animated: true)
    }
    
}
