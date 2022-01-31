var list = [12,0,3,9,2,21,18,27,1,5,8,-1,8]
quicksortLomuto(&list, low: 0, high: list.count - 1)
print(list)

var list2 = [12,0,3,9,2,21,18,27,1,5,8,-1,8]
quicksortHoare(&list, low: 0, high: list2.count - 1)
print(list)

var list3 = [12,0,3,9,2,21,18,27,1,5,8,-1,8]
quicksortMedian(&list, low: 0, high: list3.count - 1)
print(list)

var list4 = [12,0,3,9,2,21,18,27,1,5,8,-1,8]
quicksortDutchFlag(&list, low: 0, high: list4.count - 1)
print(list)
