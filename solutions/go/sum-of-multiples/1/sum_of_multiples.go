package sumofmultiples

import (
	"maps"
	"slices"
)

func SumMultiples(limit int, divisors ...int) int {
	seen := map[int]bool{}
	for _, d := range divisors {
		for i := 1; i < limit; i++ {
			if d != 0 && i%d == 0 {
				seen[i] = true
			}
		}

	}

	values := slices.Collect(maps.Keys(seen))
	total := 0
	for _, v := range values {
		total += v
	}

	return total
}
