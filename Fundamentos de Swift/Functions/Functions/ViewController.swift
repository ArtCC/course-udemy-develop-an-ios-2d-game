//
//  ViewController.swift
//  Functions
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        name()

        sumatorio(entero1: 10, entero2: 5)

        let suma = sumatorioConDevolucion(entero1: 13, entero2: 23)
        print(suma)
    }

    func name() {
        print("Mi nombre es Arturo.")
    }

    func sumatorio(entero1: Int, entero2: Int) {
        let suma = entero1 + entero2

        print("La suma es \(suma)")
    }

    func sumatorioConDevolucion(entero1: Int, entero2: Int) -> String {
        let suma = entero1 + entero2

        return "La suma es \(suma)"
    }
}
