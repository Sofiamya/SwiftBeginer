import UIKit

enum windows {
    case open, closed
}
enum engineStarting {
    case run, drown
}
enum Doors: Int {
    case three = 3
    case five = 5
}


class Car {
    let marka: String  //марка
    let yearOfIssue: Int  //год выпуска
    var starting: engineStarting {           //запуск двигателя
        willSet {
            if newValue == .run {
                print("Сейчас машина поедет")
            } else {
                print("Сейчас машина остановится")
            }
        }
    }
    var distanceOfWindows: windows
    
    init(marka: String, yearOfIssue: Int, starting: engineStarting, distanceOfWindows: windows ) {
        self.marka = marka
        self.yearOfIssue = yearOfIssue
        self.starting = starting
        self.distanceOfWindows = distanceOfWindows
        
    }
    func runing(_ runState: engineStarting) {
        starting = runState
    }
    func openWindow() {
        distanceOfWindows = .open
    }
    func printCar() {
        print("\nМарка: \(marka)\nГод выпуска: \(yearOfIssue)\nСостояние двигателя: \(starting == engineStarting.run ? "работает" : "не работает")\nСостояние окон: \(distanceOfWindows == windows.open ? "открыты" : "закрыты")")
    }
}

class trunkCar: Car {
    let trailer: Bool
    let height: Double
    init(marka: String, yearOfIssue: Int, starting: engineStarting, distanceOfWindows: windows, trailer: Bool, height: Double) {
        self.trailer = trailer
        self.height = height
        super.init(marka: marka, yearOfIssue: yearOfIssue, starting: starting, distanceOfWindows: distanceOfWindows)
    }
    override func openWindow() {
        print("Окна не откроются")
    }
    override func printCar() {
        super.printCar()
        print("Кузов: \(trailer ? "есть" : "нет")")
        print("Высота: \(height)")
    }
}

var car001 = trunkCar(marka: "Камаз", yearOfIssue: 2000, starting: .run, distanceOfWindows: .closed, trailer: true,height: 2.2 )

car001.printCar()
car001.openWindow()


class sportCar: Car {
    let NumberOfDoors: Doors
    
    init(marka: String, yearOfIssue: Int, starting: engineStarting, distanceOfWindows: windows, NumberOfDoors: Doors) {
        self.NumberOfDoors = NumberOfDoors
        super.init(marka: marka, yearOfIssue: yearOfIssue, starting: starting, distanceOfWindows: distanceOfWindows)
    }
    
    override func printCar() {
        super.printCar()
        print("В машине \(NumberOfDoors.rawValue) дверей\n")
    }
}

var sportCar1 = sportCar(marka: "BMB", yearOfIssue: 2018, starting: .drown, distanceOfWindows: .open, NumberOfDoors: .five)
let sportCar2 = sportCar(marka: "Toyta", yearOfIssue: 1998, starting: .drown, distanceOfWindows: .closed, NumberOfDoors: .three)
sportCar1.printCar()
sportCar2.printCar()
sportCar1.starting = .run
sportCar1.printCar()

var Car01 = Car(marka: "BMW", yearOfIssue: 2013, starting: .drown, distanceOfWindows: .closed)
var Car02 = Car(marka: "Toyta", yearOfIssue: 2019, starting: .run, distanceOfWindows: .open)

Car01.printCar()
Car02.printCar()
Car02.runing(.drown)

