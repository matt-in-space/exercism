package proteintranslation

import "errors"

var ErrStop = errors.New("stop")
var ErrInvalidBase = errors.New("invalid base")

func FromRNA(rna string) ([]string, error) {
	result := []string{}
	current := rna

	for len(current) > 0 {
		if len(current) < 3 {
			return nil, ErrInvalidBase
		}
		codon := current[:3]
		current = current[3:]
		protein, err := FromCodon(codon)
		if err == ErrInvalidBase {
			return nil, err
		}
		if err == ErrStop {
			break
		}
		result = append(result, protein)
	}

	return result, nil
}

var codonMap = map[string]string{
	"AUG": "Methionine",
	"UUU": "Phenylalanine",
	"UUC": "Phenylalanine",
	"UUA": "Leucine",
	"UUG": "Leucine",
	"UCU": "Serine",
	"UCC": "Serine",
	"UCA": "Serine",
	"UCG": "Serine",
	"UAU": "Tyrosine",
	"UAC": "Tyrosine",
	"UGU": "Cysteine",
	"UGC": "Cysteine",
	"UGG": "Tryptophan",
	"UAA": "STOP",
	"UAG": "STOP",
	"UGA": "STOP",
}

func FromCodon(codon string) (string, error) {
	if protein, ok := codonMap[codon]; ok {
		if protein == "STOP" {
			return protein, ErrStop
		}

		return protein, nil
	}

	return "", ErrInvalidBase
}
