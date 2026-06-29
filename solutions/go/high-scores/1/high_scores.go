package highscores

import "slices"

type HighScores struct {
	scores []int
}

// NewHighScores returns a new HighScores object.
func NewHighScores(scores []int) *HighScores {
	return &HighScores{scores: scores}
}

// Scores returns all the scores.
func (s *HighScores) Scores() []int {
	return s.scores
}

// Latest returns the latest (last) score.
func (s *HighScores) Latest() int {
	return s.scores[len(s.scores)-1]
}

// PersonalBest returns the best (highest) score.
func (s *HighScores) PersonalBest() int {
	high := 0
	for _, sc := range s.scores {
		if sc > high {
			high = sc
		}
	}
	return high
}

// TopThree returns the top three scores.
func (s *HighScores) TopThree() []int {
	top := []int{}
	for _, sc := range s.scores {
		if len(top) < 3 {
			top = append(top, sc)
		} else {
			for i, min := range top {
				if sc > min {
					top[i] = sc
					break
				}
			}
		}
	}
	slices.Sort(top)
	slices.Reverse(top)
	return top
}
