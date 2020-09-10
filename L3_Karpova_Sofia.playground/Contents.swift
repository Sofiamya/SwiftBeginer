import UIKit

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum windows {
    case open, closed
}
enum engineStarting {
    case run, drown
}
enum trunkGo {
    case load, unload // погрузить выгрузить
}
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct SportCar {
    let marka: String  //марка
    let yearOfIssue: Int  //год выпуска
    let trunkVolume: Int  //объем багажника
    var starting: engineStarting {           //запуск двигателя
        willSet {
            if newValue == .run {
                print("Сейчас машина поедет")
            } else {
                print("Сейчас машина остановится")
            }
        }
    }
    var distanceOfWindows: windows {           //состояние окна
        willSet {
            if newValue == .open {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
    let trunk: trunkGo // заполненость багажника
    
    mutating func runing(_ runState: engineStarting)  {
         starting = runState
    }
    mutating func windowAction(_ openWindows: windows)  {
            distanceOfWindows = openWindows
       }
    func printCar() {
        print("\nМарка: \(marka)\nГод выпуска: \(yearOfIssue)\nОбъем багажника: \(trunkVolume)\nСостояние двигателя: \(starting == engineStarting.run ? "работает" : "не работает")\nСостояние окон: \(distanceOfWindows == windows.open ? "открыты" : "закрыты")\nЗаполненость багажника: \(trunk == trunkGo.load ? "заполнен" : "пустой")")
    }
}

var Car01 = SportCar(marka: "BMW", yearOfIssue: 2013, trunkVolume: 100, starting: .drown, distanceOfWindows: .closed, trunk: .load)
var Car02 = SportCar(marka: "Toyta", yearOfIssue: 2019, trunkVolume: 50, starting: .run, distanceOfWindows: .open, trunk: .unload)
var Car03 = SportCar(marka: "MiniCuper", yearOfIssue: 2018, trunkVolume: 100, starting: .drown, distanceOfWindows: .closed, trunk: .unload)
Car02.runing(.drown)
Car01.windowAction(.open)
Car01.printCar()
Car02.printCar()

