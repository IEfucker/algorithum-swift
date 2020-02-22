 
 var testArray:[Int] = [6, 3, 4, 13, 28, 1, 89, 3, 7, 376, 2901, 7, 9, 0, 77, 89]
 
 func bubbleSort(source:[Int])->[Int]{
    var arr = source
    let len = arr.count
    for i in 0..<len-1{
        for j in 0..<len-i-1{
            if(arr[j]>arr[j+1]){
                arr.swapAt(j, j+1)
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
            arr.swapAt(i, minIndex)
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
 
 func quickSort(_ source: inout [Int], _ left:Int?, _ right:Int?)->[Int]{
    let len = source.count
    var l = left
    var r = right
    if(left==nil){
        l=0
    }
    if(right==nil){
        r = len - 1
    }
    
    if(len<2 || l! >= r!){
        return source
    }
    
    let partitionIndex = partition(&source, l!, r!)

    if(l!<partitionIndex-1){
        quickSort(&source, l, partitionIndex - 1)
    }
    if(partitionIndex+1<r!){
        quickSort(&source, partitionIndex + 1, r)
    }

    return source
 }
 
 func partition(_ source: inout [Int], _ left:Int, _ right:Int)->Int{
    let pivot = left
    var index = pivot + 1
    for i in index...right{
        if(source[i]<source[pivot]){
            source.swapAt(i,index)
            index+=1
        }
    }
    source.swapAt(pivot, index-1)
    return index - 1
 }
 
// quickSort(&testArray,nil,nil)
 
 var len:Int = 0
 func buildMaxHeap(_ source: inout [Int]){
    len = source.count
    var i = Int(len/2)
    while(i>=0){
        heapify(&source, i)
        i-=1
    }
 }
 func heapify(_ source: inout [Int], _ i:Int){
    var largest = i
    let left = i*2+1
    let right = i*2+2
    if(left < len && source[left]>source[largest]){
        largest = left
    }
    if(right < len && source[right]>source[largest]){
        largest = right
    }
    if(largest != i){
        source.swapAt(largest, i)
        heapify(&source, largest)
    }
    
 }
 
 func heapSort(_ source: inout [Int]){
    buildMaxHeap(&source)
    while(len>0){
        source.swapAt(0, len-1)
        len-=1
        heapify(&source, 0)
    }
 }
 
// heapSort(&testArray)

 func countingSort(_ source:[Int])->[Int]{
     var maxValue = source[0]
     var arr:[Int] = []
     for v in source{
         if(v>maxValue){
             maxValue = v
         }
     }
     var buckets = Array(repeating: 0, count: maxValue+1)
     for v in source {
         buckets[v]+=1
     }

    for (index, _) in buckets.enumerated(){
        while(buckets[index]>0){
            arr.append(index)
            buckets[index]-=1
        }
       }
     return arr
  }
  
  countingSort(testArray)
