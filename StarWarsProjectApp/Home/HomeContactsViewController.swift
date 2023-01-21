//
//  StarWarsContactsViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 17/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private let categories: [Category] = [.films, .people, .planets, .vehicles, .starships, .species]
    
    let homeTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        homeTableView.backgroundColor = .clear
        //Faz parte do Segundo passo:
        //Informar ao TableView de contatos onde seus métodos de protocolo de fonte de dados são implementados, neste caso, contactsViewController e em outras palavras, self.
        homeTableView.dataSource = self
        homeTableView.delegate = self
        //contactsTableView não sabe sobre esta célula. Vamos corrigi-lo registrando-o usando a string do identificador.
        // Acesse ViewDidLoad()no contactsViewControllere registre a célula no tableView.
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        setUpNavigation()
        applyContraints()
    }
    
    func applyContraints() {
        //1. primeiro Passo.
        //habilite o Auto Layout em contactsTableView definindo translatesAutoresizingMaskIntoConstraints como false.
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Defina o topAnchor de contactsTableView igual ao topAnchor da visualização principal.
        //Isso garantirá que o contactsTableView permaneça na parte superior da visualização principal.
        homeTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        //Vamos adicionar o código para as âncoras esquerda, direita e inferior semelhante ao código topAnchor.
        homeTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        homeTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
    }
}

extension HomeViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.updateCell(with: categories[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let category = categories[indexPath.row]
        let viewController: UIViewController
       
        
        switch category {
        case .films: viewController = FilmsViewController()
        case .people: viewController = PeopleViewController()
        default: viewController = FilmsViewController()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
