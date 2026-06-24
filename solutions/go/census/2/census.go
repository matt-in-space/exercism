// Package census simulates a system used to collect census data.
package census

// Resident represents a resident in this city.
type Resident struct {
	Name    string
	Age     int
	Address map[string]string
}

// NewResident registers a new resident in this city.
func NewResident(name string, age int, address map[string]string) *Resident {
	resident := Resident{
		Name:    name,
		Age:     age,
		Address: address,
	}

	return &resident
}

// HasRequiredInfo determines if a given resident has all of the required information.
func (r *Resident) HasRequiredInfo() bool {
	street, _ := r.Address["street"]
	if street == "" || r.Name == "" {
		return false
	}
	return true
}

// Delete deletes a resident's information.
func (r *Resident) Delete() {
	*r = Resident{}
}

// Count counts all residents that have provided the required information.
func Count(residents []*Resident) int {
	valid := 0
	for _, r := range residents {
		if r.HasRequiredInfo() {
			valid++
		}
	}

	return valid
}
