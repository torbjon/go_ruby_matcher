package main

import (
    "fmt"
    "strings"
    "bufio"
    "os"
)

var matched  = []string{}
var texts    = slice_from_file("data/texts.txt")
var patterns = slice_from_file("data/keywords.txt")

func slice_from_file(filename string) []string {
    f,_     := os.Open(filename)
    scanner := bufio.NewScanner(f)
    lines   := []string{}

    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }
    return lines
}

func patern_match(text string) {
    for i := 0; i < len(patterns); i++ {
        if strings.Contains(text, patterns[i]) {            
            matched = append(matched, patterns[i])
        }
    }
}

func main() {    
    for ti := 0; ti < len(texts); ti++ {
        patern_match(texts[ti])
    }

    fmt.Println(len(matched))
}
