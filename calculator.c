#include <stdio.h>

int main() {
    int a, b, result;

    printf("Enter first number: ");
    scanf("%d", &a);

    printf("Enter second number: ");
    scanf("%d", &b);

    // Inline ARM64 assembly: result = a + b
    asm ("add %w0, %w1, %w2" : "=r"(result) : "r"(a), "r"(b));

    printf("Result: %d\n", result);

    return 0;
}
