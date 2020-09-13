import UIKit
enum windows {
    case open, closed
}
enum wheels: Int {
    case four = 4, six = 6, eight = 8
}
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var marka: String { get set }
    var yearOfIssue: Int { get set }
    var mileage: Int { get set } //пробег
    var distanceOfWindows: windows { get set }
    var mp3: Bool { get set }
    }
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func openWindow()  {
        if distanceOfWindows == windows.open {
        print("Окна \(marka) уже открыты")
        } else {
        distanceOfWindows = .open
        print("Окна \(marka) открываются")
    }
}
    mutating func closedWindow(){
            if distanceOfWindows == windows.closed {
                print("Окна \(marka) уже закрыты")
            } else {
                distanceOfWindows = .closed
            print("Окна \(marka) закрываются")
            }
        }
     func start() {
            print("Машина \(marka) поехала")
        }
        func stop() {
            print("Машина \(marka) остановилась")
        }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class trunkCar: Car {
    var marka: String
    var yearOfIssue: Int
    var mileage: Int //пробег
    var distanceOfWindows: windows
    var mp3: Bool
    let bodyVolume: Int
    let numberOfWheels: wheels //кол-во колес
    
    
    init(marka: String, yearOfIssue: Int, mileage: Int, distanceOfWindows: windows, mp3: Bool, bodyVolume: Int, numberOfWheels: wheels) {
        self.marka = marka
        self.yearOfIssue = yearOfIssue
        self.mileage = mileage
        self.distanceOfWindows = distanceOfWindows
        self.mp3 = mp3
        self.bodyVolume = bodyVolume
        self.numberOfWheels = numberOfWheels
    }
}
   //4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension trunkCar: CustomStringConvertible {
    var description: String{
        return "\nМарка: \(marka)\nГод выпуска: \(yearOfIssue)\nПробег: \(mileage)\nСостояние окон: \(distanceOfWindows == windows.open ? "Открыты" : "Закрыты")\nmp3: \(mp3 ? "Установлен" : "Отсутствует")\nОбъем кузова: \(bodyVolume)\nКоличество колес: \(numberOfWheels.rawValue)\n"    // определяем, что именно будет выводиться
    }
}

class sportСar: Car {
    var marka: String
    var yearOfIssue: Int
    var mileage: Int
    var distanceOfWindows: windows
    var mp3: Bool
    let maxSpeed: Int
    let sportMood: Bool
    init(marka: String, yearOfIssue: Int, mileage: Int, distanceOfWindows: windows, mp3: Bool, maxSpeed: Int, sportMood: Bool) {
           self.marka = marka
           self.yearOfIssue = yearOfIssue
           self.mileage = mileage
           self.distanceOfWindows = distanceOfWindows
           self.mp3 = mp3
           self.maxSpeed = maxSpeed
           self.sportMood = sportMood
       }
}
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension sportСar: CustomStringConvertible {
    var description: String{
        return "\nМарка: \(marka)\nГод выпуска: \(yearOfIssue)\nПробег: \(mileage)\nСостояние окон: \(distanceOfWindows == windows.open ? "Открыты" : "Закрыты")\nmp3: \(mp3 ? "Установлен" : "Отсутствует")\nМаксимальная скорость: \(maxSpeed)\nСпортивный режим: \(sportMood ? "Есть" : "Отсутствует")\n"     // определяем, что именно будет выводиться
    }
}
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var Car1 = trunkCar(marka: "Honda", yearOfIssue: 2010, mileage: 6000, distanceOfWindows: .closed, mp3: true, bodyVolume: 100, numberOfWheels: .four)
var Car2 = trunkCar(marka: "BMW", yearOfIssue: 2020, mileage: 1500, distanceOfWindows: .open, mp3: false, bodyVolume: 200, numberOfWheels: .eight)
var Car3 = trunkCar(marka: "Toyta", yearOfIssue: 2016, mileage: 4000, distanceOfWindows: .closed, mp3: true, bodyVolume: 150, numberOfWheels: .six)
var Car4 = trunkCar(marka: "Mersedes", yearOfIssue: 2014, mileage: 12000, distanceOfWindows: .closed, mp3: true, bodyVolume: 250, numberOfWheels: .four)


var SportCar1 = sportСar(marka: "Porsche", yearOfIssue: 2003, mileage: 15000, distanceOfWindows: .closed, mp3: true, maxSpeed: 200, sportMood: false)
var SportCar2 = sportСar(marka: "Lamborghini", yearOfIssue: 2015, mileage: 5000, distanceOfWindows: .open, mp3: false, maxSpeed: 250, sportMood: true)
var SportCar3 = sportСar(marka: "Ferrari", yearOfIssue: 2018, mileage: 3550, distanceOfWindows: .closed, mp3: false, maxSpeed: 300, sportMood: true)
//6. Вывести сами объекты в консоль.
SportCar1.start()
SportCar1.stop()
print(SportCar1)

SportCar2.closedWindow()
print(SportCar2)

SportCar3.openWindow()
print(SportCar3)


Car1.start()
print(Car1)

Car3.openWindow()
print(Car3)

Car4.closedWindow()
print(Car4)

Car2.stop()
print(Car2)


