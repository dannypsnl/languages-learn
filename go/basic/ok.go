package main

func main() {
    i := 0
    if val, ok := i.(int64); ok {
        println(val)
    }
    m := map[string]string {
        "hi": "dan",
    }
    if val, ok := m["hi"]; ok {
        println(val)
    }
}
