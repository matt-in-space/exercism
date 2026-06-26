package listops

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	result := initial
	for _, v := range s {
		result = fn(result, v)
	}
	return result
}

func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	result := initial
	for i := len(s) - 1; i >= 0; i-- {
		result = fn(s[i], result)
	}
	return result
}

func (s IntList) Filter(fn func(int) bool) IntList {
	filtered := make(IntList, 0, len(s))
	for _, v := range s {
		if fn(v) {
			filtered = append(filtered, v)
		}
	}
	return filtered
}

func (s IntList) Length() int {
	return len(s)
}

func (s IntList) Map(fn func(int) int) IntList {
	mapped := make(IntList, 0, len(s))
	for _, v := range s {
		mapped = append(mapped, fn(v))
	}
	return mapped
}

func (s IntList) Reverse() IntList {
	reversed := make(IntList, 0, len(s))
	for i := len(s) - 1; i >= 0; i-- {
		reversed = append(reversed, s[i])
	}
	return reversed
}

func (s IntList) Append(lst IntList) IntList {
	return append(s, lst...)
}

func (s IntList) Concat(lists []IntList) IntList {
	result := s
	for _, lst := range lists {
		result = append(result, lst...)
	}
	return result
}
