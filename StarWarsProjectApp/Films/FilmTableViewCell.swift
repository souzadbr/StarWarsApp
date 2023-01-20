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
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .green

        self.contentView.addSubview(titlleLabel)
        self.contentView.addSubview(episodeLabel)
        self.contentView.addSubview(openingCrawlLabel)

        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
        //titlleLabel
        
        titlleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        titlleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:  30).isActive = true
    
        //episodeLabel
        episodeLabel.topAnchor.constraint(equalTo: self.titlleLabel.topAnchor, constant: 20).isActive = true
        episodeLabel.leadingAnchor.constraint(equalTo: self.titlleLabel.leadingAnchor, constant: 120).isActive = true
        episodeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //openingCrawlLabel
        
}
    
    func updateCell(with film: Film) {
        titlleLabel.text = film.title
        episodeLabel.text = "Episodio: \(film.episodeId)"
        openingCrawlLabel.text = film.openingCrawl

    }
}

