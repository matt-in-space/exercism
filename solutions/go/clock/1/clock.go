package clock

import "fmt"

// Define the Clock type here.
type Clock struct {
	hour   int
	minute int
}

func normalize(h, m int) (int, int) {
	for m < 0 {
		m += 60
		h--
	}

	for h < 0 {
		h += 24
	}

	for m >= 60 {
		m -= 60
		h++
	}

	for h >= 24 {
		h -= 24
	}

	return h, m
}

func New(h, m int) Clock {
	h, m = normalize(h, m)

	return Clock{
		hour:   h,
		minute: m,
	}
}

func (c Clock) Add(m int) Clock {
	h, m := normalize(c.hour, c.minute+m)

	return Clock{
		hour:   h,
		minute: m,
	}
}

func (c Clock) Subtract(m int) Clock {
	h, m := normalize(c.hour, c.minute-m)

	return Clock{
		hour:   h,
		minute: m,
	}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}
