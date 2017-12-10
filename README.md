
#Assignment: Caching the inverse of a matrix
##Submission by Tom Schaffer

Within this repo is the R code for my peer graded assignment, corresponding to Week 3 of the R programming unit for the Johns Hopkins Data Science Coursera course.

Pasted below is an example of my R code being run, with the output being compared to the output of R's native `solve()` function for a sample invertible matrix assigned to `z`. As an additional confirmation, the inverted matrices solved using `solve()` and `cacheSolve()` both yield the identity matrix (slightly off due to rounding) when multiplied with input `z`. Finally, running `cacheSolve()` a second time recalls the data cached in `makeCacheMatrix()`. 

```
> z
   [,1] [,2] [,3]
z1    1    5    7
z2    3    4    2
z3    2    2    4
> y<-solve(z)
> y
              z1         z2         z3
[1,] -0.28571429  0.1428571  0.4285714
[2,]  0.19047619  0.2380952 -0.4523810
[3,]  0.04761905 -0.1904762  0.2619048
> z%*%y
              z1           z2            z3
z1  1.000000e+00 2.220446e-16  2.220446e-16
z2  8.326673e-17 1.000000e+00 -1.110223e-16
z3 -5.551115e-17 1.110223e-16  1.000000e+00
> x<-makeCacheMatrix(z)
> y1<-cacheSolve(x)
> y1
              z1         z2         z3
[1,] -0.28571429  0.1428571  0.4285714
[2,]  0.19047619  0.2380952 -0.4523810
[3,]  0.04761905 -0.1904762  0.2619048
> identical(y,y1)
[1] TRUE
> y1%*%z
              [,1]         [,2]          [,3]
[1,]  1.000000e+00 0.000000e+00 -4.440892e-16
[2,] -1.110223e-16 1.000000e+00  2.220446e-16
[3,]  1.110223e-16 1.110223e-16  1.000000e+00
> cacheSolve(x)
getting cached data
              z1         z2         z3
[1,] -0.28571429  0.1428571  0.4285714
[2,]  0.19047619  0.2380952 -0.4523810
[3,]  0.04761905 -0.1904762  0.2619048
>   
```