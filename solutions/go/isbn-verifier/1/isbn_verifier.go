package isbnverifier

import "strings"

func IsValidISBN(isbn string) bool {
	isbn = strings.ReplaceAll(isbn, "-", "")

	if len(isbn) != 10 {
		return false
	}

	sum := 0

	for i, char := range isbn {
		if char == 'X' && i != 9 {
			return false
		}

		digit := 10

		if char != 'X' {
			digit = int(char - '0')
		}

		sum += digit * (10 - i)
	}
	return sum%11 == 0
}
