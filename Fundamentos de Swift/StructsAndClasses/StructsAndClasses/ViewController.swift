//
//  ViewController.swift
//  StructsAndClasses
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import UIKit

struct UserData {
    let name: String
    let lastname: String

    func nameAndLastname() -> String {
        "\(name) \(lastname)"
    }
}

class Vehicle {
    var model: String
    var year: Int

    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }

    func describing() -> String {
        return "Mi vehículo es un \(model) y es del año \(year)"
    }
}

class Turismo: Vehicle {
    var kilometraje: Int

    init(model: String, year: Int, kilometraje: Int) {
        self.kilometraje = kilometraje

        super.init(model: model, year: year)
    }

    func plus() -> String {
        return "Mi vehículo es un \(model) y es del año \(year). Tiene \(kilometraje) kilómetros."
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserData(name: "Arturo", lastname: "Carretero")

        print(user.name)
        print(user.nameAndLastname())

        let vehicle = Vehicle(model: "Seat Ibiza", year: 1985)

        print(vehicle.model)
        print(vehicle.describing())

        let turismo = Turismo(model: "Seat León", year: 2000, kilometraje: 150000)

        print(turismo.model)
        print(turismo.describing())
        print(turismo.plus())
    }
}
