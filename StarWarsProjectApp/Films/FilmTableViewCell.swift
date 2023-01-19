//
//  FilmTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import UIKit

final class FilmTableViewCell: UITableViewCell {
    
   
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
    let titlleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let openingCrawlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let directoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.contentMode = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(stackView)
        self.stackView.addSubview(titlleLabel)
        self.stackView.addSubview(episodeLabel)
        self.stackView.addSubview(openingCrawlLabel)
        self.stackView.addSubview(directoLabel)
        self.stackView.addSubview(releaseDateLabel)
        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
       
//        self.contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true

        //titleLabel
        titlleLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 10).isActive = true
        titlleLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        titlleLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 10).isActive = true
    
//        self.stackView.addSubview(episodeLabel)
        episodeLabel.topAnchor.constraint(equalTo: self.titlleLabel.topAnchor, constant: 8).isActive = true
        episodeLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        episodeLabel.leftAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        
//        self.stackView.addSubview(openingCrawlLabel)
        openingCrawlLabel.topAnchor.constraint(equalTo: self.episodeLabel.topAnchor, constant: 8).isActive = true
        openingCrawlLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        openingCrawlLabel.leftAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
//        self.stackView.addSubview(directoLabel)
        directoLabel.topAnchor.constraint(equalTo: self.openingCrawlLabel.topAnchor, constant: 8).isActive = true
        directoLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        directoLabel.leftAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
//        self.stackView.addSubview(releaseDateLabel)
        releaseDateLabel.topAnchor.constraint(equalTo: self.directoLabel.topAnchor, constant: 8).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 10).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10).isActive = true 
       
        
}
    func updateCell(with film: Film) {
        titlleLabel.text = film.title
        episodeLabel.text = "Episodio: \(film.episodeId)"
        openingCrawlLabel.text = film.openingCrawl
        directoLabel.text = film.director
        releaseDateLabel.text = film.releaseDate.formatterDate()
    }
}

