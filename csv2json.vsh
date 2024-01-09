#!/usr/local/bin/v run

import encoding.csv
import json
import os

enum Quadrant {
	language
	technique
	platform
	tool
}

enum Ring {
	adopt
	trial
	assess
	hold
}

enum Trend {
	down = -1
	constant = 0
	up = 1
}

// NOTE The naming of the  field has to match the format used in the index.html
struct Entry {
	label    string
	link     string
	quadrant Quadrant
	ring     Ring
	trend    Trend
}

fn evaluate_trend(isNew string) Trend {
	if isNew == 'TRUE' {
		return Trend.up
	}

	return Trend.constant
}

fn evaluate_ring(ring string) Ring {
	match ring {
		'Trial' { return Ring.trial }
		'Assess' { return Ring.assess }
		'Hold' { return Ring.hold }
		'Adopt' { return Ring.adopt }
		else { panic('None matching ring: $ring') }
	}
}

fn evaluate_quadrant(quadrant string) Quadrant {
	match quadrant {
		'languages-and-frameworks' { return Quadrant.language }
		'Platforms' { return Quadrant.platform }
		'Tools' { return Quadrant.tool }
		'Techniques' { return Quadrant.technique }
		else { panic('None matching quadrant: $quadrant') }
	}
}

fn parse_csv(path string) []Entry {
	data_csv := os.read_file(path) or { panic('Unable to read: $path: $err') }
	mut parser := csv.new_reader(data_csv)
	header := parser.read() or { panic('Unable to read first line of $path: $err') }
	println('Parsing CSV with  header: $header')

	mut entries := []Entry{}
	for {
		// NOTE: Since the or is used to detect the end of the file, no error handling possible...
		item := parser.read() or { break }

		// NOTE: check  header if it fits.
		label := item[0]
		ring := evaluate_ring(item[1])
		quadrant := evaluate_quadrant(item[2])
		trend := evaluate_trend(item[3])
		link := item[4]

		entry := Entry{label, link, quadrant, ring, trend}
		entries << entry
	}

	return entries
}

fn write_json(entries []Entry, path string) {
	data_json := json.encode(entries)
	mut file := os.create(path) or { panic('Failed to create output file $path: $err') }
	file.write_string(data_json)
	file.close()
}

// Transform Blibs CSV to Blibs JSON, readable by the  webpage
csv := 'data/Technology Radar - Technology Radar.csv'
entries := parse_csv(csv)
json := 'data/entries.json'
write_json(entries, json)
println('Wrote $csv to $json')
