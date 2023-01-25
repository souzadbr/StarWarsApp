//
//  StarshipViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 23/01/23.
//


import UIKit

class StarshipViewController: UIViewController {
    
    let network = NetworkManager()
    var starships: [Starship]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.starshipTableView.reloadData()
            }
        }
    }
    
    let starshipTableView = UITableView()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        view.addSubview(starshipTableView)
        starshipTableView.delegate = self
        starshipTableView.dataSource = self
        starshipTableView.register(StarshipTableViewCell.self, forCellReuseIdentifier: "starshipCell")
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        applyConstraints()
        setUpNavigation()
        getDataStarship()
    }
    
    func applyConstraints() {
        
        starshipTableView.translatesAutoresizingMaskIntoConstraints = false
        starshipTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        starshipTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        starshipTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        starshipTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func setUpNavigation() {
        navigationItem.title = "Starships"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
    }
    
    func getDataStarship() {
        network.fetchStarship { (starship) in
            self.starships = starship
        }
    }
}


extension StarshipViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return starships?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath) as? StarshipTableViewCell else {
            fatalError("Issue dequeuing starshipCell")
        }
        cell.updateCell(with: starships?[indexPath.row] ?? Starship(name: "Algo", classification: "deu", language: "errado"))
        
        return cell
    }
}

extension StarshipViewController: UITableViewDelegate {
    
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
