package hamming

import "errors"

func Distance(a, b string) (int, error) {
	diff := 0

	if len(a) != len(b) {
		return 0, errors.New("No length match")
	}

	for i, char := range a {
		if string(char) != string(b[i]) {
			diff++
		}
	}

	return diff, nil
}
