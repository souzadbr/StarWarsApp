//
//  PeopleTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 20/01/23.
//

import UIKit

 class PeopleTableViewCell: UITableViewCell {
    
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
    let personLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        self.contentView.addSubview(personLabel)
        
        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
        
        personLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 40).isActive = true
        personLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        
    }
    
    func updateCell(with people: Person) {
        personLabel.text = "Person: \(people.name)"
    }
}
