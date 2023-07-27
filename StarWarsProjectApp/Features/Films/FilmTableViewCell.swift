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
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let openingCrawlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(cgColor: .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
        
        self.contentView.addSubview(titlleLabel)
        self.contentView.addSubview(episodeLabel)
        self.contentView.addSubview(openingCrawlLabel)
        
        applyConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyConstraints() {
        let stackView = UIStackView(arrangedSubviews: [titlleLabel, episodeLabel, openingCrawlLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        //stackView.spacing = 0 // Ajuste o valor do espaçamento aqui
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        
        ])
    }
    
    func updateCell(with film: Film?) {
        titlleLabel.text = "Film: \(film?.title ?? "")"
        episodeLabel.text = "Episode: \(film?.episodeId ?? 0)"
        openingCrawlLabel.text = film?.openingCrawl
       
        layoutIfNeeded()
    }
}

