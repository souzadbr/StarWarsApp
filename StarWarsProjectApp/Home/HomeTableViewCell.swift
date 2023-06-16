//
//  StarWarsTableViewCell.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 17/01/23.
//

import Foundation
import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    //propriedade instanciada é uma UIImageView dentro de uma função anonima
    let profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // a imagem nunca será esticada verticalmente ou horizontalmente
        img.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        //img.layer.cornerRadius = 35 // arredonda a imageView
        img.clipsToBounds = true
        return img
    } ()
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(cgColor: .init(red: 0, green: 0, blue: 0, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(cgColor: .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(nameLabel)
        applyContraints()
        
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
    
    func applyContraints() {
        //profileImageView
        //na linha abaixo profileImageView será definidocentralizado verticalmente usando centerYAnchor em relação a exibição pai self.contentView
        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:  30).isActive = true
        
        //Heigth e Width da imagem do perfil são definidos como 70 e seu cornerRadius deve ser metado do tamanho da altura para que tenha a imagem em forma de circulo
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: self.profileImageView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.profileImageView.leadingAnchor, constant: 120).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
    }
    func updateCell(with category: Category) {
        profileImageView.image = category.icon
        nameLabel.text = category.title
    }
}
