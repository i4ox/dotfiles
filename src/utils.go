package main

import "fmt"

type Level int

const (
	None Level = iota + 1
	Low
	Medium
	High
)

func (l Level) String() string {
	return [...]string{"none", "low", "medium", "high"}[l-1]
}

func (l Level) EnumIndex() int {
	return int(l)
}

type Position int

const (
	Top Position = iota + 1
	Bottom
)

func (p Position) String() string {
	return [...]string{"top", "bottom"}[p-1]
}

func (p Position) EnumIndex() int {
	return int(p)
}

func isStringHex(s string) bool {
	if len(s) != 7 || s[0] != '#' {
		return false
	}

	for i := 1; i < 7; i++ {
		if !((s[i] >= '0' && s[i] <= '9') ||
			(s[i] >= 'A' && s[i] <= 'F') ||
			(s[i] >= 'a' && s[i] <= 'f')) {
			return false
		}
	}
	return true
}

func hexCharToNum(c byte) int {
	k := int(c)

	if c >= '0' && c <= '9' {
		k -= int('0')
	} else if c >= 'a' && c <= 'f' {
		k -= int('a') - 10
	} else if c >= 'A' && c <= 'F' {
		k -= int('A') - 10
	}

	return k
}

func HexToRGBA(s string, alpha float64) string {
	if !isStringHex(s) {
		return "INVALID_HEX"
	}

	r := uint8(hexCharToNum(s[1])*16 + hexCharToNum(s[2]))
	g := uint8(hexCharToNum(s[3])*16 + hexCharToNum(s[4]))
	b := uint8(hexCharToNum(s[5])*16 + hexCharToNum(s[6]))

	return fmt.Sprintf("rgba(%d, %d, %d, %f)", r, g, b, alpha)

}

func FormatWord(s string, options [][]string) string {
	if len(s) < 8 {
		return s
	}

	optionName := ""
	prefix := ""
	suffix := ""
	f := 0

	for i := 0; i < len(s)-7; i++ {
		tmp := (s)[i : i+7]

		if tmp == "dotSet(" {
			// fmt.Println(tmp)
			prefix = (s)[:i]
			optionName = (s)[i+7:]
			f = 1
			break
		}
	}

	if f == 0 {
		return s
	}

	f = len(optionName) - 1
	for f > 0 {
		if optionName[f] == ')' {
			break
		} else {
			suffix += string(optionName[f])
		}
		optionName = optionName[:len(optionName)-1]
		f--
	}
	optionName = optionName[:len(optionName)-1]

	runes := []rune(suffix)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	suffix = string(runes)

	if f == 0 {
		return s
	}

	f = 0
	for _, option := range options {
		if optionName == (option)[0] {
			optionName = (option)[1]
			f = 1
			break
		}
	}

	if f == 0 {
		fmt.Println("\033[1;31minvalid option\033[0m", "`", optionName, "`:")
		fmt.Println(" |")
		fmt.Println(" |", s)
		fmt.Print(" | ")
		for i := 0; i < len(optionName); i++ {
			fmt.Print("~")
		}
		fmt.Println()

		fmt.Println("\033[1;33mkeeping the word as is!\033[0m")
		return s
	}

	optionName = prefix + optionName + suffix
	s = optionName
	return s
}
