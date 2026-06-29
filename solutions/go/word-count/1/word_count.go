package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	phrase = strings.ToLower(phrase)

	re := regexp.MustCompile(`[^a-z0-9' ]`)
	phrase = re.ReplaceAllString(phrase, " ")

	re = regexp.MustCompile(`( ')|(' )|(^')|('$)`)
	phrase = re.ReplaceAllString(phrase, " ")

	words := strings.Split(phrase, " ")

	freq := map[string]int{}

	for _, word := range words {
		word = strings.TrimSpace(word)

		if len(word) == 0 {
			continue
		}

		count := freq[word]
		freq[word] = count + 1
	}

	return freq
}
