package anagram

import (
	"maps"
	"strings"
)

func Detect(subject string, candidates []string) []string {
	results := []string{}

	for _, c := range candidates {
		if isAnagram(subject, c) {
			results = append(results, c)
		}
	}

	return results
}

func isAnagram(subject, test string) bool {
	if len(subject) != len(test) {
		return false
	}

	if strings.ToLower(subject) == strings.ToLower(test) {
		return false
	}

	return maps.Equal(graphemes(subject), graphemes(test))
}

func graphemes(word string) map[string]int {
	result := map[string]int{}

	for _, c := range word {
		s := strings.ToLower(string(c))
		result[s] += 1
	}

	return result
}
