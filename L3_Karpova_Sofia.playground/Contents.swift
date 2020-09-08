import UIKit

// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum CarAction {
    case switchEhgine
    case switchWindows
    case addLoad
}

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

// 2. Описать в каждом наследнике специфичные для него свойства. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct SportCar {
    let brand: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var filledTrunkVolume: Double
    var isStartedEngine: Bool
    var isWindowsOpen: Bool
    
    mutating func action(_ runAction: CarAction) {
        switch runAction {
        case .switchEhgine:
            isStartedEngine.toggle()
        case .switchWindows:
            isWindowsOpen.toggle()
        case .addLoad:
            let cargoVolume: Double = 5 // груз определенного объема
            let newLoad = filledTrunkVolume + cargoVolume
            
            if newLoad <= trunkVolume {
                filledTrunkVolume = newLoad
            }
            else {
                print("Груз объемом \(cargoVolume) не помещается в багажник автомобиля \(brand)!")
            }
        }
    }
    
    func printConsole() {
        print("Марка: \(brand), год выпуска: \(yearOfIssue), объем багажника: \(trunkVolume), заполненный объем багажника: \(filledTrunkVolume), двигатель запущен: \(isStartedEngine ? "да" : "нет"), окна открыты: \(isWindowsOpen ? "да" : "нет").")
    }
}

struct TrunkCar {
    let brand: String
    let yearOfIssue: Int
    let bodyVolume: Double
    var filledBodyVolume: Double
    var isStartedEngine: Bool
    var isWindowsOpen: Bool
    
    mutating func action(_ runAction: CarAction) {
        switch runAction {
        case .switchEhgine:
            isStartedEngine.toggle()
        case .switchWindows:
            isWindowsOpen.toggle()
        case .addLoad:
            let cargoVolume: Double = 20 // груз определенного объема
            let newLoad = filledBodyVolume + cargoVolume
            
            if newLoad <= bodyVolume {
                filledBodyVolume = newLoad
            }
            else {
                print("Груз объемом \(cargoVolume) не помещается в кузов грузовика \(brand)!")
            }
        }
    }
    
    func printConsole() {
        print("Марка: \(brand), год выпуска: \(yearOfIssue), объем кузова: \(bodyVolume), заполненный объем кузова: \(filledBodyVolume), двигатель запущен: \(isStartedEngine ? "да" : "нет"), окна открыты: \(isWindowsOpen ? "да" : "нет").")
    }
}

// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var car1 = SportCar(brand: "Honda", yearOfIssue: 2012, trunkVolume: 18, filledTrunkVolume: 0, isStartedEngine: true, isWindowsOpen: false)
var car2 = SportCar(brand: "BMW", yearOfIssue: 2017, trunkVolume: 22, filledTrunkVolume: 6, isStartedEngine: false, isWindowsOpen: true)

car1.action(CarAction.switchEhgine)
car1.action(CarAction.addLoad)
car2.action(CarAction.switchWindows)

var truck1 = TrunkCar(brand: "Mersedes benz", yearOfIssue: 2019, bodyVolume: 120, filledBodyVolume: 87, isStartedEngine: false, isWindowsOpen: false)
var truck2 = TrunkCar(brand: "MAN", yearOfIssue: 2016, bodyVolume: 125, filledBodyVolume: 125, isStartedEngine: false, isWindowsOpen: false)

truck1.action(CarAction.switchWindows)
truck2.action(CarAction.addLoad)

// 6. Вывести значения свойств экземпляров в консоль.

car1.printConsole()
car2.printConsole()

truck1.printConsole()
truck2.printConsole()
