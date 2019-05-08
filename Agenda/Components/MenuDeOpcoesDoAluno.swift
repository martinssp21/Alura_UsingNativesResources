//
//  MenuDeOpcoesDoAluno.swift
//  Agenda
//
//  Created by Rodrigo Martins on 08/05/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
enum MenuActionSheetAluno{
    case sms
    case ligacao
}

class MenuDeOpcoesDoAluno: NSObject {
    func configuraMenuDeOpcoesDoAluno(completion: @escaping(_ opcao: MenuActionSheetAluno) -> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            completion(.sms)
        }
        menu.addAction(sms)
        
        let ligacao = UIAlertAction(title: "Ligar", style: .default) { (acao) in
            completion(.ligacao)
        }
        menu.addAction(ligacao)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        return menu
    }

}
