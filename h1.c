#include <stdio.h>
#include <math.h>
#include "h1.h"

void factorial(double *a){
    int b;
    int pa = *a;
    if(ceil(pa)){
        b = ceil(pa);
    }else{
        printf("can't factorial:%g",&a);
    }
    int ans = 0;
    for(int i = 0;i<b;i++){
        int p = b - i;
        if(ans == 0){
            ans += p;
        }else{
            ans *= p;
        }
    }
    *a = ans;
}