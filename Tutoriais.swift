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
                "nome_autor": "Autor \(i)",
                "desc_tutorial": "Desc \(i)",
                "nome_tutorial": "Tutorial \(i)",
                ])
        }
        return tutoriais
    }
}
