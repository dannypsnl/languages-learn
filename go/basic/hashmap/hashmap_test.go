package hashmap_test

import (
	"fmt"
	"testing"

	"github.com/dannypsnl/hashmap"

	"github.com/stretchr/testify/require"
)

func TestHashMap(t *testing.T) {
	m := hashmap.New()

	testCases := []struct {
		key   string
		value interface{}
	}{
		{key: "a", value: 1},
		{key: "a", value: "aj,fbe"},
		{key: "b", value: 21},
		{key: "c", value: 'c'},
		{key: "wflkw", value: []byte("efefg")},
		{key: "dlkfn", value: 1},
		{key: "sds", value: 1},
	}

	for i, testCase := range testCases {
		t.Run(fmt.Sprintf("case-%d", i), func(t *testing.T) {
			m.Set(testCase.key, testCase.value)
			require.Equal(t, testCase.value, m.Get(testCase.key))
		})
	}
}
