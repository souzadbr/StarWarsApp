//
//  PeopleTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 20/01/23.
//

import UIKit

 class PeopleTableViewCell: UITableViewCell {
    
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
     let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
     
     let heightLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 16)
         label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
         label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
         return label
     } ()
     
     let hairColorLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 16)
         label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
         label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
         return label
     } ()
    
     let skinColorLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 16)
         label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
         label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
         return label
     } ()
     
     let genderLabel: UILabel = {
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
        self.contentView.addSubview(hairColorLabel)
        self.contentView.addSubview(skinColorLabel)
        self.contentView.addSubview(genderLabel)
        
        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 70).isActive = true
        
        //episodeLabel
        hairColorLabel.topAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 50).isActive = true
        hairColorLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: 30).isActive = true
        hairColorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //openingCrawlLabel
        skinColorLabel.topAnchor.constraint(equalTo: self.hairColorLabel.topAnchor, constant: 20).isActive = true
        skinColorLabel.leadingAnchor.constraint(equalTo: self.hairColorLabel.leadingAnchor).isActive = true
        skinColorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //genderLabel
        genderLabel.topAnchor.constraint(equalTo: self.skinColorLabel.topAnchor, constant: 20).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: self.skinColorLabel.leadingAnchor).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
    }
    
    func updateCell(with people: Person) {
        nameLabel.text = "Name Person: \(people.name)"
        hairColorLabel.text = "Hair Color Person: \(people.hairColor)"
        skinColorLabel.text = "Skin Color Person: \(people.skinColor)"
        genderLabel.text = "Gender: \(people.gender)"
    }
}


