//
//  SpeciesViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 26/01/23.
//

import UIKit

class SpeciesViewController: UIViewController {
    
    let network = NetworkManager()
    var specie: [Specie]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.specieTableView.reloadData()
                self.hideLoadingView()
            }
        }
    }
    
    let loadingView = LoadingView()
    let specieTableView = UITableView()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        view.addSubview(specieTableView)
        specieTableView.delegate = self
        specieTableView.dataSource = self
        specieTableView.register(SpeciesTableViewCell.self, forCellReuseIdentifier: "speciepCell")
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        applyConstraints()
        setUpNavigation()
        showLoadingView()
        getDataStarship()
    }
    
    func applyConstraints() {
        
        specieTableView.translatesAutoresizingMaskIntoConstraints = false
        specieTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        specieTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        specieTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        specieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func setUpNavigation() {
        navigationItem.title = "Species"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
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
    
    func getDataStarship() {
        showLoadingView()
        
        network.fetchSpecies { (specie) in
            self.specie = specie
        }
    }
}


extension SpeciesViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return specie?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "speciepCell", for: indexPath) as? SpeciesTableViewCell else {
            fatalError("Issue dequeuing speciepCell")
        }
        cell.updateCell(with: specie?[indexPath.row] ?? Specie(name: "Deu", language: "Errado"))
        
        return cell
    }
}

extension SpeciesViewController: UITableViewDelegate {
    
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
