//
//  HomeModel.swift
//  MyNotes
//
//  Created by Erma on 21/2/24.
//

import UIKit

protocol HomeModelProtocol {
    func getNotes()
}

class HomeModel: HomeModelProtocol {
   
    private let controller: HomeControllerProtocol?
    
    init(controller: HomeControllerProtocol) {
        self.controller = controller
    }
    
    private var notes: [String] = ["Do homework", "Buy chocolate", "Meet somebody", "Go to the gym!"]
    
    func getNotes() {
        controller?.onSuccessNotes(notes: notes)
    }
}
