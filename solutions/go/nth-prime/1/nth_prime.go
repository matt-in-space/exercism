package nthprime

import (
	"errors"
)

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("Prime cannot be computed")
	}

	primes := []int{}
	current := 2

	for len(primes) < n {
		if isPrime(current) {
			primes = append(primes, current)
		}

		current++
	}

	return primes[len(primes)-1], nil
}

func isPrime(n int) bool {
	for i := 2; i < n; i++ {
		if n%i == 0 {
			return false
		}
	}

	return true
}
