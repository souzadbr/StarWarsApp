//
//  Films.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//


import UIKit

class FilmsViewController: UIViewController {
    
    let network = NetworkManager()
    var films: [Film]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.filmTableView.reloadData()
                print("Carregando")
            }
        }
    }
   
    let filmTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(filmTableView)
        filmTableView.delegate = self
        filmTableView.dataSource = self
        filmTableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "filmCell")
        view.backgroundColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        applyContraints()
        setUpNavigation()
        getDataFilm()
        
    }
    
    func applyContraints() {
        filmTableView.translatesAutoresizingMaskIntoConstraints = false
        //Defina o topAnchor de contactsTableView igual ao topAnchor da visualização principal.
        //Isso garantirá que o contactsTableView permaneça na parte superior da visualização principal.
        filmTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        //Vamos adicionar o código para as âncoras esquerda, direita e inferior semelhante ao código topAnchor.
        filmTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        filmTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        filmTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Films"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))]
    }
    
    func getDataFilm() {
        network.fetchFilms { (films) in
            self.films = films
        }
    }
}

extension FilmsViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return films?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? FilmTableViewCell else {
            fatalError("Issue dequeuing filmCell ")
          }
        cell.updateCell(with: films?[indexPath.row] ?? Film(title: "Deu Errado", episodeId: 1, openingCrawl: "a chamada"))
            
            return cell
        }
    }
    


extension FilmsViewController: UITableViewDelegate {
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
