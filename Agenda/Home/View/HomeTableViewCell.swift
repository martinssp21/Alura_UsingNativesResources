//
//  HomeTableViewCell.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var labelNomeDoAluno: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurarCelula(_ aluno: Aluno){
        self.labelNomeDoAluno.text = aluno.nome
        self.imageAluno.layer.cornerRadius = self.imageAluno.frame.width / 2
        self.imageAluno.layer.masksToBounds = true
        if let imagemDoAluno = aluno.foto as? UIImage{
            self.imageAluno.image = imagemDoAluno
        }
    }

}
