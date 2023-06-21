//
//  PlanetsViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 23/01/23.
//

import UIKit

class PlanetsViewController: UIViewController {
    
    
    let network = NetworkManager()
    var planets: [Planet]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.planetTableView.reloadData()
                self.hideLoadingView()
            }
        }
    }
    
    let loadingView = LoadingView()
    let planetTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(planetTableView)
        planetTableView.delegate = self
        planetTableView.dataSource = self
        planetTableView.register(PlanetsTableViewCell.self, forCellReuseIdentifier: "planetCell")
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        applyContraints()
        setUpNavigation()
        showLoadingView()
        getDataPlanet()
    }
    
    func applyContraints() {
        planetTableView.translatesAutoresizingMaskIntoConstraints = false
        
        planetTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        planetTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        planetTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        planetTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Planets"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1 ))]
    }
    
    func showLoadingView() {
        // Add the loading view as a subview and start animating the activity indicator
        view.addSubview(loadingView)
        loadingView.startAnimating()
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func hideLoadingView() {
        // Remove the loading view from the superview and stop animating the activity indicator
        loadingView.removeFromSuperview()
        loadingView.stopAnimating()
    }
    
    func getDataPlanet() {
        showLoadingView()
        
        network.fetchPlanets { (planets) in
            self.planets = planets
            
        }
    }
}

extension PlanetsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? PlanetsTableViewCell else {
            fatalError("Issue dequeuing planetCell")
        }
        
        cell.updateCell(with: planets?[indexPath.row] ?? Planet(name: "Deu Errado"))
        
        return cell 
    }
}

extension PlanetsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
