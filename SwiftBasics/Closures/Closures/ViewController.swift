//
//  ViewController.swift
//  Closures
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import UIKit

class ViewController: UIViewController {
    let sumar = { (num1: Int, num2: Int) -> Int in
        return num1 + num2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let sumatorio = sumar(5,6)

        print(sumatorio)

        sum(num1: 10, num2: 24) { sumatorio in
            print("La suma es: \(sumatorio)")
        }
    }

    func sum(num1: Int, num2: Int, completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            completion(num1 + num2)
        }
    }
}
