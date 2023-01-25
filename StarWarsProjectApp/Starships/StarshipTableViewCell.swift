//
//  StarshipTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 23/01/23.
//

import UIKit

class StarshipTableViewCell: UITableViewCell {

    
    let nameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 18)
       label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
       label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
       return label
   } ()
    
    let classificationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        self.contentView.addSubview(classificationLabel)
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
        classificationLabel.topAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 50).isActive = true
        classificationLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: 30).isActive = true
        classificationLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //languageLabel
        languageLabel.topAnchor.constraint(equalTo: self.classificationLabel.topAnchor, constant: 20).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: self.classificationLabel.leadingAnchor).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
    }
    
    func updateCell(with starship: Starship) {
        nameLabel.text = "Name Person: \(starship.name)"
        classificationLabel.text = "Hair Color Person: \(starship.classification)"
        languageLabel.text = "Gender: \(starship.language)"
    }
}
