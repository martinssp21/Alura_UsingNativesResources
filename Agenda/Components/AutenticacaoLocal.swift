//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Rodrigo Martins on 08/05/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {
    
    var error : NSError?
    
    func autorizaUsuario(completion:@escaping(_ autenticado:Bool) -> Void){
        let contexto = LAContext()
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Autenticação necessária para exclusão de aluno") { (resposta, erro) in
                completion(resposta)
            }
            
        }
    }
}
