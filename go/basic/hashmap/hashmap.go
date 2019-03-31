package hashmap

type Node struct {
	key   string
	value interface{}
}

type HashMap struct {
	size    int
	buckets [][]Node
}

// 100 just a random picked number at here since I don't want to decide size when New a hashMap
const defaultSize = 100

func New() *HashMap {
	m := &HashMap{
		size:    defaultSize,
		buckets: make([][]Node, defaultSize),
	}
	for i, _ := range m.buckets {
		m.buckets[i] = make([]Node, 0)
	}

	return m
}

func (h *HashMap) getIndex(k string) int {
	v := int(JenkinsHash(k))
	if v < 0 {
		v = -v
	}
	return v % h.size
}

func (h *HashMap) Set(k string, v interface{}) {
	index := h.getIndex(k)
	bucket := h.buckets[index]

	for i := range bucket {
		n := &bucket[i]
		if n.key == k {
			n.value = v
			// early return while updated
			return
		}
	}

	h.buckets[index] = append(h.buckets[index], Node{key: k, value: v})
}

func (h *HashMap) Get(k string) interface{} {
	index := h.getIndex(k)
	bucket := h.buckets[index]
	for _, node := range bucket {
		if node.key == k {
			return node.value
		}
	}
	return nil
}

func JenkinsHash(key string) uint {
	var h uint
	for _, c := range key {
		h += uint(c)
		h += (h << 10)
		h ^= (h >> 6)
	}
	h += (h << 3)
	h ^= (h >> 11)
	h += (h << 15)
	return h
}
