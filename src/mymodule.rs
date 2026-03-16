pub fn my_fib(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        return my_fib(n - 1) + my_fib(n - 2);
    }
}
