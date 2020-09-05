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
