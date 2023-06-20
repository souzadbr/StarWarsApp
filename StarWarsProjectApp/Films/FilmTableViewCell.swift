//
//  FilmTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import UIKit

final class FilmTableViewCell: UITableViewCell {
    
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
    
    let filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.8
        imageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageView.layer.shadowRadius = 4
        imageView.layer.masksToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titlleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let openingCrawlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 50
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(cgColor: .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
        
        self.contentView.addSubview(filmImageView)
        self.contentView.addSubview(titlleLabel)
        self.contentView.addSubview(episodeLabel)
        self.contentView.addSubview(openingCrawlLabel)
        
        applyConstraints()
        
        // Adicionando efeito de sombra
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyConstraints() {
        let stackView = UIStackView(arrangedSubviews: [filmImageView, titlleLabel, episodeLabel, openingCrawlLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 3 // Ajuste o valor do espaçamento aqui
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            filmImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3) // Ajuste a altura da imagem conforme necessário
        ])
    }
    
    func updateCell(with film: Film?, image: UIImage) {
        titlleLabel.text = "Film: \(film?.title ?? "")"
        episodeLabel.text = "Episode: \(film?.episodeId ?? 0)"
        openingCrawlLabel.text = film?.openingCrawl
        filmImageView.image = image
        
        layoutIfNeeded()
    }
}

