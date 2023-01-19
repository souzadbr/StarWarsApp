//
//  Films.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//


import UIKit

class FilmsViewController: UIViewController {
    
    let network = NetworkManager()
    var film: [Film] = [] {
        didSet {
            DispatchQueue.main.async {
                self.filmTableView.reloadData()
            }
        }
    }
    private lazy var filmTableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .clear
            tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "filmCell")
            tableView.separatorStyle = .none
            return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(filmTableView)
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        setUpNavigation()
        applyContraints()
        getDataFilm()
    }
    
    func applyContraints() {
        //Defina o topAnchor de contactsTableView igual ao topAnchor da visualização principal.
        //Isso garantirá que o contactsTableView permaneça na parte superior da visualização principal.
        filmTableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 32).isActive = true
        //Vamos adicionar o código para as âncoras esquerda, direita e inferior semelhante ao código topAnchor.
        filmTableView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 15).isActive = true
        filmTableView.rightAnchor.constraint(equalTo:view.rightAnchor, constant: 15).isActive = true
        filmTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: 15).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Films"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
    }
    
    func getDataFilm() {
        network.fetchFilm { film in
            self.film = film
        }
    }
}

extension FilmsViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return film.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as! FilmTableViewCell
        cell.updateCell(with: film [indexPath.row])
        return cell
    }
}

extension FilmsViewController: UITableViewDelegate {
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
