import UIKit
//Написать функцию, которая определяет, четное число или нет.

func isEvenNumber ( a: Int ) {
    if a % 2 == 0 {
        print("Число четное")
    }
    else {
        print ("Число не четное")
    }
}
isEvenNumber(a: 5)
//Написать функцию, которая определяет, делится ли число без остатка на 3.
func isNumber ( a: Int ) {
    if a % 3 == 0 {
        print("Число делится на три без остатка")
    }
    else {
        print ("Число делится на три с остатком")
    }
}
isNumber(a: 8)

//Создать возрастающий массив из 100 чисел.
var oneHundred: Array<Int> = []
for i in 1...100{
    oneHundred.append(i)
}
print(oneHundred)

//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var toDelete = oneHundred.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(toDelete)

// Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
print("\nФибоначчи:")
func fibonachi (mas: Array<Double>) -> Array<Double> {
    var mas_fibonachi = mas
    if mas_fibonachi.count == 0 {
        mas_fibonachi.append(0)
    } else if mas_fibonachi.count == 1 {
        mas_fibonachi.append(1)
    } else {
        let number_fibonachi: Double = mas_fibonachi[mas_fibonachi.endIndex - 1] + mas_fibonachi[mas_fibonachi.endIndex - 2]
        mas_fibonachi.append(number_fibonachi)
    }
    return mas_fibonachi
}

var mas_fibonachi: Array<Double> = []
for _ in 1...100 {
    mas_fibonachi = fibonachi(mas: mas_fibonachi)
}

print(mas_fibonachi)


//* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
print("\nНатуральные числа")
// квадрат числа
extension Int {
    func powerOf2() -> Int {
        return self * self
    }
}
// до скольки считаем?
let max = 545
// первое простое число
var p = 2
// заполняем массив
var masNat = (2...max).map{$0}
// вычисления
while (p.powerOf2() <= max) {
    masNat.removeAll(where: {$0 >= p.powerOf2() && $0.isMultiple(of: p)})
    p = masNat.first(where: {$0 > p})!
}
// выводим результаты
print("Всего \(masNat.count) простых чисел: ", masNat)



