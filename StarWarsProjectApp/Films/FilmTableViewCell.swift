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
        contentView.backgroundColor = .clear

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
        
        titlleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 40).isActive = true
        titlleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        
        //episodeLabel
        episodeLabel.topAnchor.constraint(equalTo: self.titlleLabel.topAnchor, constant: 50).isActive = true
        episodeLabel.leadingAnchor.constraint(equalTo: self.titlleLabel.leadingAnchor).isActive = true
        episodeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //openingCrawlLabel
        openingCrawlLabel.topAnchor.constraint(equalTo: self.episodeLabel.topAnchor, constant: 20).isActive = true
        openingCrawlLabel.leadingAnchor.constraint(equalTo: self.episodeLabel.leadingAnchor).isActive = true
        openingCrawlLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
       
        
}
    
    func updateCell(with film: Film) {
        titlleLabel.text = "Film: \(film.title)"
        episodeLabel.text = "Episode: \(film.episodeId)"
        openingCrawlLabel.text =  film.openingCrawl

    }
}

