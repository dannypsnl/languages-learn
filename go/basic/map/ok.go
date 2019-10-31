package main

func main() {
	var i interface{} = 0
	if val, ok := i.(int); ok {
		println(val)
	}
	m := map[string]string{
		"hi": "dan",
	}
	if val, ok := m["hi"]; ok {
		println(val)
	}
}
