//
//  SpeciesTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 26/01/23.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    let languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(languageLabel)
        
        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 70).isActive = true
        
        //classificationLabel
        languageLabel.topAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 50).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: 30).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    
    func updateCell(with specie: Specie) {
        nameLabel.text = "Name: \(specie.name)"
        languageLabel.text = "Language: \(specie.language)"
    }
    
}
