def fib(int n):
    """Print the Fibonacci series up to n."""

    cdef int a, b
    a, b = 0, 1
    while b < n:
        a, b = b, a + b
    print ("%dth Fibonacci number is %d" % (n,b))
