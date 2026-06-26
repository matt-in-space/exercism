package armstrongnumbers

import (
	"math"
	"strconv"
)

func IsNumber(n int) bool {
	digits := strconv.Itoa(n)
	exp := float64(len(digits))
	sum := 0
	for _, d := range digits {
		n, _ := strconv.Atoi(string(d))
		sum += int(math.Pow(float64(n), exp))
	}
	return sum == n
}
