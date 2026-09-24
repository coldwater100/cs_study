#include <stdio.h>

int calc()
{
    int a = 65, b = 35, c = 89, val;
    
    val = (a + b) % c;

    return val;
}

int main()
{
    int a;

    a = calc();

    if(a == 0x58){
        printf("congratulation!!\n");
        printf("You patched program successfully!!\n");
    }

    else{
        printf("Hmm...\n");
        printf("You need to patch the program.\n");
    }

    return 0;
}