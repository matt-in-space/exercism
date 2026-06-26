package paasio

import (
	"io"
	"sync"
)

// Define readCounter and writeCounter types here.
type readCounter struct {
	r     io.Reader
	bytes int64
	ops   int
	mu    sync.RWMutex
}

type writeCounter struct {
	w     io.Writer
	bytes int64
	ops   int
	mu    sync.RWMutex
}

type readWriteCounter struct {
	readCounter
	writeCounter
}

// For the return of the function NewReadWriteCounter, you must also define a type that satisfies the ReadWriteCounter interface.

func NewWriteCounter(writer io.Writer) WriteCounter {
	return &writeCounter{
		w:  writer,
		mu: sync.RWMutex{},
	}
}

func NewReadCounter(reader io.Reader) ReadCounter {
	return &readCounter{
		r:  reader,
		mu: sync.RWMutex{},
	}
}

func NewReadWriteCounter(readwriter io.ReadWriter) ReadWriteCounter {
	return &readWriteCounter{
		readCounter:  readCounter{r: readwriter, mu: sync.RWMutex{}},
		writeCounter: writeCounter{w: readwriter, mu: sync.RWMutex{}},
	}
}

func (rc *readCounter) Read(p []byte) (int, error) {
	rc.mu.Lock()
	defer rc.mu.Unlock()

	n, err := rc.r.Read(p)
	rc.bytes += int64(n)
	rc.ops++
	return n, err
}

func (rc *readCounter) ReadCount() (int64, int) {
	rc.mu.RLock()
	defer rc.mu.RUnlock()
	return rc.bytes, rc.ops
}

func (wc *writeCounter) Write(p []byte) (int, error) {
	wc.mu.Lock()
	defer wc.mu.Unlock()

	n, err := wc.w.Write(p)
	wc.bytes += int64(n)
	wc.ops++
	return n, err
}

func (wc *writeCounter) WriteCount() (int64, int) {
	wc.mu.RLock()
	defer wc.mu.RUnlock()
	return wc.bytes, wc.ops
}
