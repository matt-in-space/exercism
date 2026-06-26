package phonenumber

import (
	"errors"
	"fmt"
	"regexp"
)

func Number(phoneNumber string) (string, error) {
	re := regexp.MustCompile(`\D`)
	phoneNumber = re.ReplaceAllString(phoneNumber, "")

	re = regexp.MustCompile(`^1?([2-9]\d{2}[2-9]\d{6})$`)
	match := re.FindStringSubmatch(phoneNumber)

	if match == nil {
		return "", errors.New("Invalid format")
	}

	return match[1], nil
}

func AreaCode(phoneNumber string) (string, error) {
	num, err := Number(phoneNumber)

	if err != nil {
		return "", err
	}

	return num[:3], nil
}

func Format(phoneNumber string) (string, error) {
	num, err := Number(phoneNumber)

	if err != nil {
		return "", err
	}

	p1 := num[:3]
	p2 := num[3:6]
	p3 := num[6:]

	formatted := fmt.Sprintf("(%s) %s-%s", p1, p2, p3)
	return formatted, nil
}
