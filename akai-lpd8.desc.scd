(
deviceName: "LPD8",
protocol: 'midi',
deviceType: 'drumpad',
elementTypes: ['slider', 'pad'],
status: (
	linux: "unknown",
	osx: "tested by mads kjeldgaard 3. january 2019",
	win: "unknown"),

idInfo: "LPD8",

// hardwarePages: [1, 2, 3, 4],

deviceInfo: (
	vendorURI: 'http://www.akaipro.com/products/pad-controllers/lpd-8',
	manualURI: 'http://b8e57dc469f9d8f4cea5-1e3c2cee90259c12021d38ebd8ad6f0f.r79.cf2.rackcdn.com/Product_Documents/lpd8___quickstart_guide___reva_00.zip_75688efe67e4e1d41d271a534869a61c.zip',
	description: "LPD8 | Laptop Pad Controller",
	features: [],
	notes: "This only works with presets 1-4 having their pads set to momentary midi nums 37-44, retaining their own midi channels (0-3)",
	hasScribble: false
),
elementsDesc: (
	elements: [

		// ------ cc -------------
		(key: \sl,
			elements:
			(0..3).collect{|prog|
				(key: prog.asSymbol,
					shared: ('midiMsgType': 'cc', 'elementType': 'slider', 'spec': 'midiCC'),
					elements: (1..8).collect{|midinum, i|
						( key: i.asSymbol, 'midiNum':  midinum, 'midiChan': prog)}
				)
			}
		),

		// ------ Touch sensitive pads -------------
		(key: \pad,
			elements:
			(0..3).collect{|prog|
				(key: prog.asSymbol,
					shared: ('midiMsgType': 'noteOn', 'elementType': 'pad', 'spec': 'midiVel'),
					elements:
					(37..44).collect{|midinum, i|
						(key: i.asSymbol, 'midiNum': midinum, 'midiChan': prog)
					}
				)
			}
		),

	]
)
);