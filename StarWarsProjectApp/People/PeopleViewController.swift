//
//  PeopleViewController.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 20/01/23.
//

import UIKit


class PeopleViewController: UIViewController {
    
    let network = NetworkManager()
    var people: [Person]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
                print ("Carregando")
            }
        }
    }
    
    let peopleTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(peopleTableView)
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        //Faz parte do Segundo passo:
        //Informar ao TableView de contatos onde seus métodos de protocolo de fonte de dados são implementados, neste caso, contactsViewController e em outras palavras, self.
        
        //contactsTableView não sabe sobre esta célula. Vamos corrigi-lo registrando-o usando a string do identificador.
        // Acesse ViewDidLoad()no contactsViewControllere registre a célula no tableView.
        peopleTableView.register(PeopleTableViewCell.self, forCellReuseIdentifier: "peopleCell")
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        setUpNavigation()
        applyContraints()
        getDataPeople()
    }
    
    func applyContraints() {
        //1. primeiro Passo.
        //habilite o Auto Layout em contactsTableView definindo translatesAutoresizingMaskIntoConstraints como false.
        peopleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Defina o topAnchor de contactsTableView igual ao topAnchor da visualização principal.
        //Isso garantirá que o contactsTableView permaneça na parte superior da visualização principal.
        peopleTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        //Vamos adicionar o código para as âncoras esquerda, direita e inferior semelhante ao código topAnchor.
        peopleTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        peopleTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        peopleTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "People"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
    }
    
    func getDataPeople() {
        network.fetchPeople { (people) in
            self.people = people
        }
    }
}

extension PeopleViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell
        cell.updateCell(with: people?[indexPath.row] ?? Person(name: "Deu", hairColor: "Erro", skinColor: "Aqui", gender: "Gente!"))
        return cell
    }
}

extension PeopleViewController: UITableViewDelegate {
    
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

