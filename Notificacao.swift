//
//  Notificacao.swift
//  Telas
//
//  Created by Student on 12/17/15.
//  Copyright © 2015 Student. All rights reserved.
//

import Foundation

class Notificacao {
    static func listar_notificacoe(user_id: String) -> [[String:String]] {
        var notificacoes = [[String: String]]()
        
        for i in 1...20 {
            notificacoes.append([
                "id": "\(i)",
                "user_id": user_id,
                "titulo": "Notificacao \(i)",
                "descricao": "Descricao \(i)",
                "pedido": "\(i%2 == 0)"
            ])
        }
        
        return notificacoes
    }
}
