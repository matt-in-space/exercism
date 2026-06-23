package lasagnamaster

func PreparationTime(layers []string, timePerLayer int) int {
	if timePerLayer == 0 {
		timePerLayer = 2
	}

	return len(layers) * timePerLayer
}

func Quantities(layers []string) (int, float64) {
	noodles := filter(layers, "noodles")
	sauce := filter(layers, "sauce")
	return 50 * len(noodles), 0.2 * float64(len(sauce))
}

func AddSecretIngredient(provided []string, own []string) {
	last := provided[len(provided)-1]
	(own)[len(own)-1] = last
}

func ScaleRecipe(quantities []float64, numPortions int) []float64 {
	result := make([]float64, len(quantities))

	for i, q := range quantities {
		result[i] = q * float64(numPortions) / 2
	}

	return result
}

func unique(layers []string) []string {
	seen := make(map[string]bool)
	result := []string{}

	for _, layer := range layers {
		if !seen[layer] {
			result = append(result, layer)
			seen[layer] = true
		}
	}

	return result
}

func filter(layers []string, toSelect string) []string {
	result := []string{}

	for _, layer := range layers {
		if layer == toSelect {
			result = append(result, layer)
		}
	}

	return result
}
