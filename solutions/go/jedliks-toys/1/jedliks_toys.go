package jedlik

import (
	"fmt"
	"math"
)

func (c *Car) Drive() {
	if c.battery >= c.batteryDrain {
		c.distance += c.speed
		c.battery -= c.batteryDrain
	}
}

func (c Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", c.distance)
}

// TODO: define the 'DisplayBattery() string' method
func (c Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", c.battery)
}

func (c Car) CanFinish(dist int) bool {
	loops := int(math.Ceil(float64(dist) / float64(c.speed)))
	return loops*c.batteryDrain <= c.battery
}
