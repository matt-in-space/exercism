package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	i := 0

	if n <= 0 {
		return i, errors.New("n must be greater than 0")
	}

	for n != 1 {
		i++

		if n%2 == 0 {
			n /= 2
		} else {
			n = 3*n + 1
		}
	}

	return i, nil
}
