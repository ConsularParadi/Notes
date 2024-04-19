
### Binary Search


> [!Algo]  
> 1) Find mid elem and compare it with target.
> 2) If less or more, go in either direction and repeat algo considering mid(+-)1 to update start or end.

> [!hint] 
> Only works for monotonic data (increasing or decreasing)

```
def binarySearch(arr, key):
	s, e = 0, len(arr) - 1
	while(s <= e):
		mid = s + (e-s)//2 #To allow indexes of maximum value an integer takes
		if (arr[mid] == key): return mid
		elif (key < arr[mid]): 	e = mid - 1
		elif (key > arr[mid]): s = mid + 1
		else: raise Exception
	return -1
```

> [!Complexity] 
>  `Time Complexity -> O(log(n))`

