use std::time::Instant;

mod mymodule;
use mydep;


fn main() {
    for _i in 0..2 {
        for _j in 0..10 {
            let t0 = Instant::now();
            let fb = mymodule::my_fib(20);
            println!(" MY_FIB_20: {:?} ({:?})", fb, t0.elapsed());
        }

        for _j in 0..10 {
            let t0 = Instant::now();
            let fb = mydep::fib(20);
            println!("DEP_FIB_20: {:?} ({:?})", fb, t0.elapsed());
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::mymodule;

    #[test]
    fn test_my_fib() {
        // 0 1 2 3 4 5 6 7
        // 0 1 1 2 3 5 8 13
        assert_eq!(mymodule::my_fib(1), 1);
        assert_eq!(mymodule::my_fib(5), 5);
        assert_eq!(mymodule::my_fib(7), 13);
    }
}
