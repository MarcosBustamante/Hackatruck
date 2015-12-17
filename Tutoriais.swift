//
//  Tutoriais.swift
//  Telas
//
//  Created by Student on 12/16/15.
//  Copyright © 2015 Student. All rights reserved.
//

import Foundation

class Tutoriais{

    static func listarTutoriais() -> [[String: String]]{
        var tutoriais = [[String: String]]()
        for i in 1...20 {
            tutoriais.append([
                "id": "\(i)",
                "nome_autor": "Autor \(i)",
                "desc_tutorial": "Desc \(i)",
                "nome_tutorial": "Tutorial \(i)",
                "likes": "\(i)",
                "visto": "\(20 - i)",
                "publicado": "\(i%2 == 0)",
                ])
        }
        return tutoriais
    }
    
    static func pedirTutorial(titulo: String, descricao: String, tags: String) -> Bool {
        return true
    }
    
    static func visto(tutorial_id: String) {
        return
    }
    
    static func like(tutorial_id: String) {
        return
    }
}
