package luhn

import (
	"strings"
	"unicode"
)

func Valid(id string) bool {
	id = strings.ReplaceAll(id, " ", "")

	if len(id) < 2 {
		return false
	}

	// Check that all digits are numeric
	for _, c := range id {
		if !unicode.IsDigit(c) {
			return false
		}
	}

	// Split the id into individual digits
	digits := []int{}
	for _, c := range id {
		digits = append(digits, int(c-'0'))
	}

	// Iterate in reverse order, doubling every second digit
	for i := len(digits) - 2; i >= 0; i -= 2 {
		digits[i] *= 2

		if digits[i] > 9 {
			digits[i] -= 9
		}
	}

	// Sum the digits
	sum := 0
	for _, d := range digits {
		sum += d
	}

	return sum%10 == 0
}
