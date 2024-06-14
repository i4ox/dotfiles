package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	configs := [][]string{
		{"i3", "config"},
		{"i3status", "config.toml"},
		{"picom", "picom.conf"},
		{"polybar", "config.ini"},
		{"alacritty", "alacritty.toml"},
		{"flameshot", "flameshot.ini"},
		{"rofi", "config.rasi"},
		{"zathura", "zathurarc"},
	}

	var borderValue float64 = levelToValue(border, 2, 4, 8)
	var gapValue float64 = levelToValue(gap, 4, 8, 12)
	var transparencyValue float64 = levelToValue(transparency, 0.1, 0.3, 0.5)
	var blurValue float64 = levelToValue(blur, 1, 3, 5)
	var cornerRadiusValue float64 = levelToValue(cornerRadius, 4, 8, 16)
	var colorNames []string = []string{
		"bg",
		"fg",
		"gray",
		"red",
		"green",
		"yellow",
		"orange",
		"blue",
		"aqua",
		"purple",
	}

	var options [][]string

	var tmpStr string
	var themeValue []string = theme

	// generate foreground and background colors
	for i := 0; i < 2; i++ {
		for j := 0; j < 4; j++ {
			options = append(
				options,
				[]string{"color_" + colorNames[i] + strconv.Itoa(j+1), themeValue[4*i+j]},
			)
			options = append(
				options,
				[]string{
					"color_" + colorNames[i] + strconv.Itoa(j+1) + "_rgba",
					HexToRGBA(themeValue[4*i+j], (1.0 - transparencyValue)),
				},
			)

			hexValue := fmt.Sprintf("%.2x", int(255*(1.0-transparencyValue)))
			tmpStr = themeValue[4*i+j] + hexValue
			options = append(
				options,
				[]string{"color_" + colorNames[i] + strconv.Itoa(j+1) + "_a", tmpStr},
			)

		}
	}

	// generate base16 colors
	for i := 2; i < len(colorNames); i++ {
		for j := 0; j < 2; j++ {
			options = append(
				options,
				[]string{"color_" + colorNames[i] + strconv.Itoa(j+1), themeValue[2*i+4+j]},
			)
			options = append(
				options,
				[]string{
					"color_" + colorNames[i] + strconv.Itoa(j+1) + "_rgba",
					HexToRGBA(themeValue[2*i+4+j], (1.0 - transparencyValue)),
				},
			)

			hexValue := fmt.Sprintf("%.2x", int(255*(1.0-transparencyValue)))
			tmpStr = themeValue[2*i+4+j] + hexValue
			options = append(
				options,
				[]string{"color_" + colorNames[i] + strconv.Itoa(j+1) + "_a", tmpStr},
			)

		}
	}

	// options = append(options, []string{"window_manager", windowManager})
	options = append(options, []string{"font", font})
	options = append(options, []string{"font_style", fontStyle})
	options = append(options, []string{"font_size", strconv.Itoa(fontSize)})
	options = append(
		options,
		[]string{"transparency_invert", strconv.FormatFloat(1.0-transparencyValue, 'f', 6, 64)},
	)
	options = append(options, []string{"blur", strconv.Itoa(int(blurValue))})
	options = append(options, []string{"gap", strconv.Itoa(int(gapValue))})
	options = append(options, []string{"border", strconv.Itoa(int(borderValue))})
	options = append(options, []string{"if_i3bar", ifI3Bar()})
	options = append(options, []string{"bar_cmd", barCmd})
	options = append(options, []string{"bar_position", barPosition.String()})
	options = append(options, []string{"if_bar_bottom", ifBarButtom()})
	options = append(options, []string{"bar_gap_top", strconv.Itoa(int(gapValue * 2))})
	options = append(options, []string{"bar_height", strconv.Itoa(fontSize + 20)})
	options = append(options, []string{"corner_radius", strconv.Itoa(int(cornerRadiusValue))})
	options = append(options, []string{"shadow", strconv.FormatBool(shadowValue)})

	// for _, option := range options {
	// 	fmt.Printf("%s\n", option)
	// }

	for i := 0; i < len(configs); i++ {
		inConfigPath := "../" + ".config/" + configs[i][0] + "/" + configs[i][1]
		outConfigPath := os.Getenv("HOME") + "/.config/" + configs[i][0]

		if _, err := os.Stat(outConfigPath); err == nil {
			tmpStr := configs[i][0]
			f := false

			for j := 0; j < len(configs); j++ {
				if tmpStr == configs[j][0] && i != j {
					f = true
					break
				}
			}

			if !f {
				os.RemoveAll(outConfigPath)
				os.Mkdir(outConfigPath, os.ModePerm)
			}
		} else {
			os.Mkdir(outConfigPath, os.ModePerm)
		}

		outConfigPath += "/" + configs[i][1]
		inputFile, err := os.OpenFile(inConfigPath, os.O_RDONLY, 0644)

		if err == nil {
			defer inputFile.Close()

			outputFile, err := os.Create(outConfigPath)

			if err == nil {
				defer outputFile.Close()
				scanner := bufio.NewScanner(inputFile)

				for scanner.Scan() {
					line := scanner.Text()
					words := strings.Fields(line)
					var outLine string
					for _, word := range words {
						outLine += FormatWord(word, options) + " "
					}
					if len(outLine) > 0 {
						outLine = outLine[:len(outLine)-1]
					}
					outputFile.WriteString(outLine + "\n")
				}
			} else {
				fmt.Println("Failed to create output file: " + outConfigPath)
			}
		} else {
			fmt.Println("Failed to open input file: " + inConfigPath)
		}
	}
}

func levelToValue(l Level, mn, md, mx float64) float64 {
	switch l {
	case Low:
		return mn
	case Medium:
		return md
	case High:
		return mx
	}
	return 0
}

func ifI3Bar() string {
	if barCmd == "i3bar" {
		return ""
	} else {
		return "#"
	}
}

func ifBarButtom() string {
	if barPosition.String() == "bottom" {
		return ""
	} else {
		return "#"
	}
}
