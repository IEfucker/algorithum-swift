 
 var testArray:[Int] = [6, 3, 4, 13, 28, 1, 89, 3, 7, 376, 2901, 7, 9, 0, 77, 89]
 
 func arraySwap( arr:inout [Int],i:Int,j:Int){
    let temp = arr[i]
    arr[i]=arr[j]
    arr[j]=temp
 }
 
 func bubbleSort(source:[Int])->[Int]{
    var arr = source
    let len = arr.count
    for i in 0..<len-1{
        for j in 0..<len-i-1{
            if(arr[j]>arr[j+1]){
                arraySwap(arr: &arr, i: j, j: j+1)
            }
        }
    }
    
    return arr
 }
// bubbleSort(source:testArray)
 
 func selectionSort(source:[Int])->[Int]{
    var arr = source
    let len = arr.count
    var minIndex:Int
    for i in 0..<len-1{
        minIndex = i
        for j in i+1..<len{
            if(arr[j]<arr[minIndex]){
                minIndex = j
            }
            
        }
        if(minIndex != i){
            arraySwap(arr: &arr, i: i, j: minIndex)
        }
    }
    return arr
 }
 
// selectionSort(source: testArray)
 
 func insertionSort(source:[Int])->[Int]{
    var arr = source
    let len = arr.count
    for i in 1..<len{
        var j = i-1
        let current = arr[i]
        while(j>=0 && current<arr[j]){
            arr[j+1] = arr[j]
            j-=1
        }
        arr[j+1]=current
    }
    return arr
 }
 
// insertionSort(source: testArray)
 
 func shellSort(source:[Int])->[Int]{
    var arr = source
    let len = arr.count
    var gap = 1
    while(gap<len/3){
        gap = gap*3+1
    }
    while(gap>0){
        for i in gap..<len{
            var j = i-gap
            let current = arr[i]
            while(j>=0 && current<arr[j]){
                arr[j+gap] = arr[j]
                j-=gap
            }
            arr[j+gap]=current
        }
        
        gap=Int(gap/3)
    }
    return arr
 }
 
// shellSort(source: testArray)
 
 func mergeSort(source:[Int])->[Int]{
    let arr = source
    let len = arr.count
    if(len<2) {
        return arr
    }
    let middle = Int(len/2)
    let left = Array(arr[0...middle-1])
    let right = Array(arr[middle...len-1])
    return merge(left: mergeSort(source: left),right: mergeSort(source: right))
 }
 
 func merge(left: [Int],right: [Int])->[Int]{
    var result:[Int] = []
    var l = left
    var r=right
    while(l.count>0 && r.count>0){
        if(l[0]>r[0]){
            result.append(r[0])
            r.removeFirst()
        }else{
            result.append(l[0])
            l.removeFirst()
        }
        
    }

    if(l.count>0){
        result+=l
    }
    if(r.count>0){
        result+=r
    }
    return result
 }
 
// mergeSort(source: testArray)
 
