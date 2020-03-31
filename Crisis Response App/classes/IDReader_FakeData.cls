global with sharing class IDReader_FakeData implements OcrParserInterface {

	public static String format; 

    public static Einstein_PredictionResult create() {
		Einstein_PredictionResult retVal = new Einstein_PredictionResult();
		retVal.probabilities = new List<Einstein_Probability>();
		String jsonStr;

		switch on format {
			when 'NewYorkState1' {
				jsonStr = '{ "probabilities": [ { "boundingBox": { "maxX": 315, "maxY": 48, "minX": 216, "minY": 24 }, "label": "DRIVER", "probability": 0.9990829 }, { "boundingBox": { "maxX": 437, "maxY": 50, "minX": 326, "minY": 24 }, "label": "license", "probability": 0.99780005 }, { "boundingBox": { "maxX": 368, "maxY": 276, "minX": 313, "minY": 263 }, "label": "BCELZ", "probability": 0.9972475 }, { "boundingBox": { "maxX": 168, "maxY": 50, "minX": 112, "minY": 22 }, "label": "York", "probability": 0.997092 }, { "boundingBox": { "maxX": 299, "maxY": 278, "minX": 202, "minY": 262 }, "label": "08/20/2020", "probability": 0.9969779 }, { "boundingBox": { "maxX": 363, "maxY": 243, "minX": 312, "minY": 230 }, "label": "NONE", "probability": 0.9966312 }, { "boundingBox": { "maxX": 153, "maxY": 350, "minX": 89, "minY": 339 }, "label": "ASD456789", "probability": 0.9964993 }, { "boundingBox": { "maxX": 395, "maxY": 228, "minX": 326, "minY": 217 }, "label": "Endorsements", "probability": 0.99629325 }, { "boundingBox": { "maxX": 105, "maxY": 52, "minX": 40, "minY": 24 }, "label": "New", "probability": 0.99611205 }, { "boundingBox": { "maxX": 279, "maxY": 143, "minX": 200, "minY": 125 }, "label": "MURPHY", "probability": 0.9960931 }, { "boundingBox": { "maxX": 239, "maxY": 227, "minX": 217, "minY": 217 }, "label": "Date:", "probability": 0.99578696 }, { "boundingBox": { "maxX": 437, "maxY": 277, "minX": 400, "minY": 262 }, "label": "BRO", "probability": 0.995784 }, { "boundingBox": { "maxX": 378, "maxY": 318, "minX": 320, "minY": 305 }, "label": "STREET", "probability": 0.9956878 }, { "boundingBox": { "maxX": 287, "maxY": 243, "minX": 202, "minY": 229 }, "label": "08/20/2012", "probability": 0.9955171 }, { "boundingBox": { "maxX": 239, "maxY": 261, "minX": 217, "minY": 251 }, "label": "Date:", "probability": 0.99533904 }, { "boundingBox": { "maxX": 269, "maxY": 159, "minX": 201, "minY": 146 }, "label": "BRENNA", "probability": 0.995229 }, { "boundingBox": { "maxX": 319, "maxY": 318, "minX": 226, "minY": 305 }, "label": "ANYWHERE", "probability": 0.9947172 }, { "boundingBox": { "maxX": 296, "maxY": 105, "minX": 267, "minY": 91 }, "label": "789", "probability": 0.99453413 }, { "boundingBox": { "maxX": 298, "maxY": 210, "minX": 203, "minY": 194 }, "label": "01/01/1970", "probability": 0.99448675 }, { "boundingBox": { "maxX": 250, "maxY": 303, "minX": 210, "minY": 292 }, "label": "Address", "probability": 0.9943639 }, { "boundingBox": { "maxX": 263, "maxY": 88, "minX": 216, "minY": 78 }, "label": "Customer", "probability": 0.99436116 }, { "boundingBox": { "maxX": 324, "maxY": 228, "minX": 312, "minY": 217 }, "label": "93", "probability": 0.9941711 }, { "boundingBox": { "maxX": 306, "maxY": 88, "minX": 265, "minY": 77 }, "label": "identifier", "probability": 0.9941618 }, { "boundingBox": { "maxX": 263, "maxY": 105, "minX": 234, "minY": 90 }, "label": "456", "probability": 0.99410856 }, { "boundingBox": { "maxX": 268, "maxY": 193, "minX": 247, "minY": 183 }, "label": "birth", "probability": 0.9939879 }, { "boundingBox": { "maxX": 348, "maxY": 194, "minX": 320, "minY": 182 }, "label": "Class", "probability": 0.99396306 }, { "boundingBox": { "maxX": 279, "maxY": 227, "minX": 253, "minY": 218 }, "label": "issue", "probability": 0.9939101 }, { "boundingBox": { "maxX": 383, "maxY": 261, "minX": 327, "minY": 251 }, "label": "Restrictions", "probability": 0.993832 }, { "boundingBox": { "maxX": 233, "maxY": 193, "minX": 211, "minY": 183 }, "label": "Date:", "probability": 0.99372584 }, { "boundingBox": { "maxX": 338, "maxY": 160, "minX": 272, "minY": 144 }, "label": "annac", "probability": 0.9933339 }, { "boundingBox": { "maxX": 213, "maxY": 88, "minX": 201, "minY": 77 }, "label": "4c", "probability": 0.9914449 }, { "boundingBox": { "maxX": 439, "maxY": 264, "minX": 415, "minY": 251 }, "label": "Eyes", "probability": 0.99098164 }, { "boundingBox": { "maxX": 230, "maxY": 105, "minX": 202, "minY": 90 }, "label": "123", "probability": 0.98986524 }, { "boundingBox": { "maxX": 446, "maxY": 230, "minX": 414, "minY": 217 }, "label": "Height", "probability": 0.9886557 }, { "boundingBox": { "maxX": 266, "maxY": 333, "minX": 245, "minY": 321 }, "label": "DL", "probability": 0.98754346 }, { "boundingBox": { "maxX": 248, "maxY": 124, "minX": 220, "minY": 114 }, "label": "Name", "probability": 0.9869271 }, { "boundingBox": { "maxX": 251, "maxY": 228, "minX": 242, "minY": 217 }, "label": "of", "probability": 0.98682517 }, { "boundingBox": { "maxX": 214, "maxY": 228, "minX": 202, "minY": 217 }, "label": "43", "probability": 0.98623496 }, { "boundingBox": { "maxX": 338, "maxY": 209, "minX": 312, "minY": 196 }, "label": "CM", "probability": 0.9862111 }, { "boundingBox": { "maxX": 251, "maxY": 261, "minX": 241, "minY": 251 }, "label": "of", "probability": 0.98576826 }, { "boundingBox": { "maxX": 283, "maxY": 264, "minX": 253, "minY": 251 }, "label": "expiry", "probability": 0.9852449 }, { "boundingBox": { "maxX": 496, "maxY": 354, "minX": 469, "minY": 345 }, "label": "Donor", "probability": 0.98469466 }, { "boundingBox": { "maxX": 214, "maxY": 262, "minX": 201, "minY": 251 }, "label": "4b", "probability": 0.9837931 }, { "boundingBox": { "maxX": 564, "maxY": 353, "minX": 518, "minY": 332 }, "label": "Murph", "probability": 0.983703 }, { "boundingBox": { "maxX": 246, "maxY": 194, "minX": 235, "minY": 183 }, "label": "of", "probability": 0.98040056 }, { "boundingBox": { "maxX": 241, "maxY": 336, "minX": 202, "minY": 320 }, "label": "CITY", "probability": 0.98022753 }, { "boundingBox": { "maxX": 264, "maxY": 349, "minX": 201, "minY": 335 }, "label": "67890-10", "probability": 0.9799933 }, { "boundingBox": { "maxX": 535, "maxY": 100, "minX": 513, "minY": 92 }, "label": "words", "probability": 0.97558606 }, { "boundingBox": { "maxX": 468, "maxY": 356, "minX": 440, "minY": 344 }, "label": "Organ", "probability": 0.97554374 }, { "boundingBox": { "maxX": 434, "maxY": 193, "minX": 414, "minY": 182 }, "label": "Sex", "probability": 0.9748556 }, { "boundingBox": { "maxX": 436, "maxY": 244, "minX": 400, "minY": 229 }, "label": "5-4\\"", "probability": 0.97386044 }, { "boundingBox": { "maxX": 517, "maxY": 346, "minX": 456, "minY": 305 }, "label": "BRENNA", "probability": 0.97272384 }, { "boundingBox": { "maxX": 84, "maxY": 349, "minX": 64, "minY": 338 }, "label": "\\"DD", "probability": 0.9685282 }, { "boundingBox": { "maxX": 224, "maxY": 318, "minX": 203, "minY": 306 }, "label": "I\'ll", "probability": 0.9672424 }, { "boundingBox": { "maxX": 412, "maxY": 228, "minX": 401, "minY": 217 }, "label": "16", "probability": 0.96658564 }, { "boundingBox": { "maxX": 518, "maxY": 94, "minX": 458, "minY": 79 }, "label": "Counterporter", "probability": 0.96466994 }, { "boundingBox": { "maxX": 413, "maxY": 262, "minX": 401, "minY": 251 }, "label": "18", "probability": 0.96246666 }, { "boundingBox": { "maxX": 563, "maxY": 94, "minX": 518, "minY": 78 }, "label": "Sunstone", "probability": 0.9575925 }, { "boundingBox": { "maxX": 207, "maxY": 303, "minX": 201, "minY": 292 }, "label": "8", "probability": 0.94251525 }, { "boundingBox": { "maxX": 318, "maxY": 193, "minX": 312, "minY": 182 }, "label": "Q", "probability": 0.9424821 }, { "boundingBox": { "maxX": 413, "maxY": 193, "minX": 401, "minY": 182 }, "label": "15", "probability": 0.9383354 }, { "boundingBox": { "maxX": 325, "maxY": 261, "minX": 313, "minY": 250 }, "label": "12", "probability": 0.9370359 }, { "boundingBox": { "maxX": 567, "maxY": 100, "minX": 535, "minY": 92 }, "label": "make", "probability": 0.92681795 }, { "boundingBox": { "maxX": 208, "maxY": 193, "minX": 201, "minY": 183 }, "label": "a", "probability": 0.9209286 }, { "boundingBox": { "maxX": 409, "maxY": 208, "minX": 400, "minY": 196 }, "label": "I", "probability": 0.8926198 }, { "boundingBox": { "maxX": 503, "maxY": 100, "minX": 453, "minY": 93 }, "label": "communion", "probability": 0.8910444 }, { "boundingBox": { "maxX": 367, "maxY": 64, "minX": 328, "minY": 51 }, "label": "USA", "probability": 0.83584124 }, { "boundingBox": { "maxX": 219, "maxY": 123, "minX": 211, "minY": 113 }, "label": "2", "probability": 0.71626174 }, { "boundingBox": { "maxX": 512, "maxY": 99, "minX": 502, "minY": 93 }, "label": "of", "probability": 0.708188 } ] }';
			}
			when 'NewYorkState2' {
				jsonStr = '{ "probabilities": [ { "boundingBox": { "maxX": 1238, "maxY": 94, "minX": 1082, "minY": 36 }, "label": "Garbora", "probability": 0.92926395 }, { "boundingBox": { "maxX": 1381, "maxY": 85, "minX": 1270, "minY": 32 }, "label": "bob", "probability": 0.8929151 }, { "boundingBox": { "maxX": 637, "maxY": 94, "minX": 411, "minY": 51 }, "label": "DRIVER", "probability": 0.7067937 }, { "boundingBox": { "maxX": 609, "maxY": 168, "minX": 509, "minY": 125 }, "label": "123", "probability": 0.97632366 }, { "boundingBox": { "maxX": 735, "maxY": 170, "minX": 630, "minY": 125 }, "label": "456", "probability": 0.98530024 }, { "boundingBox": { "maxX": 855, "maxY": 169, "minX": 755, "minY": 125 }, "label": "789", "probability": 0.9851612 }, { "boundingBox": { "maxX": 1247, "maxY": 168, "minX": 1214, "minY": 127 }, "label": "D", "probability": 0.9265734 }, { "boundingBox": { "maxX": 496, "maxY": 160, "minX": 468, "minY": 134 }, "label": "ID", "probability": 0.93550295 }, { "boundingBox": { "maxX": 1199, "maxY": 162, "minX": 1133, "minY": 133 }, "label": "Class", "probability": 0.99278224 }, { "boundingBox": { "maxX": 718, "maxY": 232, "minX": 473, "minY": 190 }, "label": "MOTORIST", "probability": 0.99751925 }, { "boundingBox": { "maxX": 1324, "maxY": 260, "minX": 1080, "minY": 209 }, "label": "SAMPLE", "probability": 0.9957503 }, { "boundingBox": { "maxX": 687, "maxY": 282, "minX": 470, "minY": 238 }, "label": "michael", "probability": 0.9932995 }, { "boundingBox": { "maxX": 746, "maxY": 278, "minX": 708, "minY": 241 }, "label": "M", "probability": 0.92162514 }, { "boundingBox": { "maxX": 556, "maxY": 335, "minX": 468, "minY": 303 }, "label": "2345", "probability": 0.9946918 }, { "boundingBox": { "maxX": 793, "maxY": 336, "minX": 564, "minY": 300 }, "label": "ANYWHERE", "probability": 0.9946239 }, { "boundingBox": { "maxX": 952, "maxY": 334, "minX": 800, "minY": 301 }, "label": "STREET", "probability": 0.9979449 }, { "boundingBox": { "maxX": 577, "maxY": 372, "minX": 468, "minY": 339 }, "label": "YOUR", "probability": 0.9935638 }, { "boundingBox": { "maxX": 681, "maxY": 373, "minX": 588, "minY": 338 }, "label": "city.", "probability": 0.97640705 }, { "boundingBox": { "maxX": 748, "maxY": 372, "minX": 691, "minY": 340 }, "label": "NY", "probability": 0.96180373 }, { "boundingBox": { "maxX": 877, "maxY": 372, "minX": 771, "minY": 341 }, "label": "12345", "probability": 0.9951267 }, { "boundingBox": { "maxX": 517, "maxY": 513, "minX": 470, "minY": 485 }, "label": "Sex", "probability": 0.9882052 }, { "boundingBox": { "maxX": 560, "maxY": 515, "minX": 526, "minY": 483 }, "label": "M", "probability": 0.9864074 }, { "boundingBox": { "maxX": 662, "maxY": 518, "minX": 586, "minY": 486 }, "label": "Height", "probability": 0.992912 }, { "boundingBox": { "maxX": 788, "maxY": 516, "minX": 672, "minY": 482 }, "label": "5\'-09\\"", "probability": 0.98809415 }, { "boundingBox": { "maxX": 864, "maxY": 518, "minX": 804, "minY": 484 }, "label": "Eyes", "probability": 0.9922085 }, { "boundingBox": { "maxX": 955, "maxY": 515, "minX": 875, "minY": 482 }, "label": "BLU", "probability": 0.9924573 }, { "boundingBox": { "maxX": 790, "maxY": 577, "minX": 538, "minY": 535 }, "label": "08/31/1978", "probability": 0.9441929 }, { "boundingBox": { "maxX": 528, "maxY": 570, "minX": 470, "minY": 542 }, "label": "DOB", "probability": 0.99058175 }, { "boundingBox": { "maxX": 824, "maxY": 639, "minX": 582, "minY": 596 }, "label": "08/31/2021", "probability": 0.97463304 }, { "boundingBox": { "maxX": 559, "maxY": 639, "minX": 470, "minY": 604 }, "label": "Expires", "probability": 0.99551564 }, { "boundingBox": { "maxX": 1217, "maxY": 687, "minX": 1053, "minY": 624 }, "label": "MICHAEL", "probability": 0.95862496 }, { "boundingBox": { "maxX": 489, "maxY": 688, "minX": 471, "minY": 662 }, "label": "E", "probability": 0.9344469 }, { "boundingBox": { "maxX": 620, "maxY": 692, "minX": 492, "minY": 658 }, "label": "NONE", "probability": 0.9938355 }, { "boundingBox": { "maxX": 229, "maxY": 740, "minX": 14, "minY": 667 }, "label": "Micharet", "probability": 0.9952879 }, { "boundingBox": { "maxX": 444, "maxY": 741, "minX": 232, "minY": 671 }, "label": "Motorist", "probability": 0.99290127 }, { "boundingBox": { "maxX": 1215, "maxY": 757, "minX": 965, "minY": 699 }, "label": "Excelsior", "probability": 0.98642737 }, { "boundingBox": { "maxX": 491, "maxY": 743, "minX": 471, "minY": 716 }, "label": "R", "probability": 0.9539207 }, { "boundingBox": { "maxX": 621, "maxY": 746, "minX": 496, "minY": 712 }, "label": "NONE", "probability": 0.9944705 }, { "boundingBox": { "maxX": 252, "maxY": 798, "minX": 141, "minY": 766 }, "label": "AUG", "probability": 0.9313189 }, { "boundingBox": { "maxX": 998, "maxY": 799, "minX": 915, "minY": 761 }, "label": "Organ", "probability": 0.98339003 }, { "boundingBox": { "maxX": 316, "maxY": 799, "minX": 261, "minY": 768 }, "label": "78", "probability": 0.9011349 }, { "boundingBox": { "maxX": 811, "maxY": 799, "minX": 555, "minY": 767 }, "label": "08/31/2018", "probability": 0.9269229 }, { "boundingBox": { "maxX": 549, "maxY": 799, "minX": 471, "minY": 774 }, "label": "issued", "probability": 0.98137087 }, { "boundingBox": { "maxX": 1259, "maxY": 799, "minX": 1036, "minY": 776 }, "label": "Arc2456780", "probability": 0.9868046 } ] }';
			}
			when 'California' {
				jsonStr = '{ "probabilities": [ { "boundingBox": { "maxX": 264, "maxY": 38, "minX": 61, "minY": 13 }, "label": "CALIFORNIA", "probability": 0.9528281 }, { "boundingBox": { "maxX": 341, "maxY": 26, "minX": 285, "minY": 14 }, "label": "DRIVER", "probability": 0.9964378 }, { "boundingBox": { "maxX": 409, "maxY": 27, "minX": 345, "minY": 14 }, "label": "license", "probability": 0.9939506 }, { "boundingBox": { "maxX": 272, "maxY": 27, "minX": 256, "minY": 21 }, "label": "usa", "probability": 0.9296889 }, { "boundingBox": { "maxX": 201, "maxY": 69, "minX": 187, "minY": 60 }, "label": "DL", "probability": 0.97251815 }, { "boundingBox": { "maxX": 285, "maxY": 69, "minX": 211, "minY": 56 }, "label": "B2201793", "probability": 0.99216676 }, { "boundingBox": { "maxX": 393, "maxY": 88, "minX": 358, "minY": 79 }, "label": "class", "probability": 0.99519324 }, { "boundingBox": { "maxX": 410, "maxY": 87, "minX": 399, "minY": 76 }, "label": "C", "probability": 0.9620771 }, { "boundingBox": { "maxX": 208, "maxY": 102, "minX": 186, "minY": 93 }, "label": "EXP", "probability": 0.9847943 }, { "boundingBox": { "maxX": 286, "maxY": 102, "minX": 214, "minY": 90 }, "label": "08/06/2012", "probability": 0.9981913 }, { "boundingBox": { "maxX": 380, "maxY": 102, "minX": 358, "minY": 93 }, "label": "end", "probability": 0.99507314 }, { "boundingBox": { "maxX": 429, "maxY": 102, "minX": 388, "minY": 91 }, "label": "NONE", "probability": 0.99695075 }, { "boundingBox": { "maxX": 201, "maxY": 121, "minX": 187, "minY": 112 }, "label": "LN", "probability": 0.9772406 }, { "boundingBox": { "maxX": 246, "maxY": 121, "minX": 210, "minY": 110 }, "label": "BALL", "probability": 0.9979327 }, { "boundingBox": { "maxX": 200, "maxY": 137, "minX": 187, "minY": 129 }, "label": "FIN", "probability": 0.96334416 }, { "boundingBox": { "maxX": 269, "maxY": 137, "minX": 210, "minY": 126 }, "label": "lucille", "probability": 0.9976069 }, { "boundingBox": { "maxX": 203, "maxY": 150, "minX": 186, "minY": 141 }, "label": "918", "probability": 0.9703955 }, { "boundingBox": { "maxX": 214, "maxY": 150, "minX": 207, "minY": 141 }, "label": "N", "probability": 0.94980776 }, { "boundingBox": { "maxX": 270, "maxY": 150, "minX": 216, "minY": 141 }, "label": "ROXBURY", "probability": 0.9905096 }, { "boundingBox": { "maxX": 234, "maxY": 163, "minX": 186, "minY": 153 }, "label": "BEVERLY", "probability": 0.98203963 }, { "boundingBox": { "maxX": 264, "maxY": 163, "minX": 238, "minY": 153 }, "label": "hils", "probability": 0.9848497 }, { "boundingBox": { "maxX": 283, "maxY": 163, "minX": 267, "minY": 153 }, "label": "CA", "probability": 0.98539275 }, { "boundingBox": { "maxX": 314, "maxY": 163, "minX": 285, "minY": 154 }, "label": "90210", "probability": 0.9749384 }, { "boundingBox": { "maxX": 210, "maxY": 181, "minX": 187, "minY": 172 }, "label": "DOB", "probability": 0.99390477 }, { "boundingBox": { "maxX": 286, "maxY": 181, "minX": 216, "minY": 170 }, "label": "08/06/1911", "probability": 0.99735427 }, { "boundingBox": { "maxX": 215, "maxY": 196, "minX": 186, "minY": 186 }, "label": "RSTR", "probability": 0.9826758 }, { "boundingBox": { "maxX": 252, "maxY": 196, "minX": 221, "minY": 186 }, "label": "NONE", "probability": 0.9935954 }, { "boundingBox": { "maxX": 457, "maxY": 203, "minX": 394, "minY": 191 }, "label": "08061911", "probability": 0.9935876 }, { "boundingBox": { "maxX": 143, "maxY": 222, "minX": 101, "minY": 201 }, "label": "Courter", "probability": 0.9744085 }, { "boundingBox": { "maxX": 173, "maxY": 218, "minX": 144, "minY": 201 }, "label": "Gun", "probability": 0.98534817 }, { "boundingBox": { "maxX": 211, "maxY": 214, "minX": 187, "minY": 208 }, "label": "povce", "probability": 0.9352807 }, { "boundingBox": { "maxX": 254, "maxY": 235, "minX": 232, "minY": 225 }, "label": "SEX", "probability": 0.99011177 }, { "boundingBox": { "maxX": 269, "maxY": 234, "minX": 262, "minY": 225 }, "label": "Is", "probability": 0.9130048 }, { "boundingBox": { "maxX": 329, "maxY": 234, "minX": 303, "minY": 225 }, "label": "HAIR", "probability": 0.992467 }, { "boundingBox": { "maxX": 358, "maxY": 234, "minX": 336, "minY": 225 }, "label": "RED", "probability": 0.99487925 }, { "boundingBox": { "maxX": 408, "maxY": 234, "minX": 380, "minY": 225 }, "label": "EYES", "probability": 0.9954472 }, { "boundingBox": { "maxX": 434, "maxY": 234, "minX": 414, "minY": 225 }, "label": "BLU", "probability": 0.99167633 }, { "boundingBox": { "maxX": 116, "maxY": 276, "minX": 48, "minY": 242 }, "label": "Aucilio", "probability": 0.99008673 }, { "boundingBox": { "maxX": 177, "maxY": 269, "minX": 121, "minY": 238 }, "label": "Coop", "probability": 0.98875964 }, { "boundingBox": { "maxX": 254, "maxY": 248, "minX": 232, "minY": 240 }, "label": "HGT", "probability": 0.99002856 }, { "boundingBox": { "maxX": 287, "maxY": 249, "minX": 262, "minY": 239 }, "label": "5\'-06", "probability": 0.98276156 }, { "boundingBox": { "maxX": 329, "maxY": 248, "minX": 304, "minY": 240 }, "label": "WGT", "probability": 0.9886282 }, { "boundingBox": { "maxX": 353, "maxY": 248, "minX": 335, "minY": 239 }, "label": "135", "probability": 0.9857858 }, { "boundingBox": { "maxX": 364, "maxY": 248, "minX": 356, "minY": 239 }, "label": "It", "probability": 0.9734265 }, { "boundingBox": { "maxX": 422, "maxY": 254, "minX": 405, "minY": 245 }, "label": "iss", "probability": 0.9878819 }, { "boundingBox": { "maxX": 247, "maxY": 265, "minX": 233, "minY": 256 }, "label": "do", "probability": 0.9878692 }, { "boundingBox": { "maxX": 384, "maxY": 266, "minX": 251, "minY": 256 }, "label": "02102.201122013.CCBDITS", "probability": 0.9559431 }, { "boundingBox": { "maxX": 459, "maxY": 265, "minX": 404, "minY": 255 }, "label": "07/02/2010", "probability": 0.9947391 } ] } ';
			}
			when 'NewJersey' {
				jsonStr = '{ "probabilities": [ { "boundingBox": { "maxX": 179, "maxY": 68, "minX": 7, "minY": 4 }, "label": "New", "probability": 0.97285044 }, { "boundingBox": { "maxX": 487, "maxY": 69, "minX": 145, "minY": 8 }, "label": "JJRRSEY", "probability": 0.75045806 }, { "boundingBox": { "maxX": 761, "maxY": 28, "minX": 654, "minY": 7 }, "label": "CLASS:", "probability": 0.99748766 }, { "boundingBox": { "maxX": 536, "maxY": 38, "minX": 477, "minY": 21 }, "label": "Motor", "probability": 0.9965641 }, { "boundingBox": { "maxX": 613, "maxY": 39, "minX": 541, "minY": 20 }, "label": "Vehicle", "probability": 0.9987627 }, { "boundingBox": { "maxX": 610, "maxY": 59, "minX": 469, "minY": 40 }, "label": "(Commission", "probability": 0.96279484 }, { "boundingBox": { "maxX": 236, "maxY": 101, "minX": 159, "minY": 79 }, "label": "AUTO", "probability": 0.99656004 }, { "boundingBox": { "maxX": 346, "maxY": 101, "minX": 244, "minY": 80 }, "label": "DRIVER", "probability": 0.99765813 }, { "boundingBox": { "maxX": 468, "maxY": 101, "minX": 353, "minY": 79 }, "label": "license", "probability": 0.9962774 }, { "boundingBox": { "maxX": 216, "maxY": 167, "minX": 121, "minY": 122 }, "label": "Winn", "probability": 0.88945466 }, { "boundingBox": { "maxX": 403, "maxY": 145, "minX": 314, "minY": 121 }, "label": "C6524", "probability": 0.9985682 }, { "boundingBox": { "maxX": 494, "maxY": 145, "minX": 412, "minY": 121 }, "label": "25647", "probability": 0.9989919 }, { "boundingBox": { "maxX": 588, "maxY": 144, "minX": 508, "minY": 121 }, "label": "12846", "probability": 0.9985331 }, { "boundingBox": { "maxX": 253, "maxY": 137, "minX": 243, "minY": 131 }, "label": "was", "probability": 0.9254551 }, { "boundingBox": { "maxX": 556, "maxY": 177, "minX": 408, "minY": 152 }, "label": "05-21-1982", "probability": 0.9888438 }, { "boundingBox": { "maxX": 98, "maxY": 173, "minX": 62, "minY": 160 }, "label": "Chief", "probability": 0.98570234 }, { "boundingBox": { "maxX": 189, "maxY": 173, "minX": 98, "minY": 161 }, "label": "Administrator", "probability": 0.99470395 }, { "boundingBox": { "maxX": 393, "maxY": 175, "minX": 344, "minY": 158 }, "label": "DOB:", "probability": 0.9970892 }, { "boundingBox": { "maxX": 392, "maxY": 213, "minX": 274, "minY": 194 }, "label": "Jessica.F", "probability": 0.9388312 }, { "boundingBox": { "maxX": 483, "maxY": 213, "minX": 400, "minY": 194 }, "label": "BRADY", "probability": 0.8961355 }, { "boundingBox": { "maxX": 319, "maxY": 234, "minX": 274, "minY": 218 }, "label": "3512", "probability": 0.99139434 }, { "boundingBox": { "maxX": 452, "maxY": 235, "minX": 324, "minY": 217 }, "label": "BLUNTBONG", "probability": 0.9807793 }, { "boundingBox": { "maxX": 505, "maxY": 234, "minX": 459, "minY": 217 }, "label": "way", "probability": 0.997451 }, { "boundingBox": { "maxX": 385, "maxY": 255, "minX": 274, "minY": 239 }, "label": "FREEHOLD", "probability": 0.99513584 }, { "boundingBox": { "maxX": 416, "maxY": 255, "minX": 391, "minY": 239 }, "label": "NJ", "probability": 0.9870683 }, { "boundingBox": { "maxX": 519, "maxY": 256, "minX": 422, "minY": 239 }, "label": "08094-434", "probability": 0.9603876 }, { "boundingBox": { "maxX": 528, "maxY": 256, "minX": 494, "minY": 239 }, "label": ".341", "probability": 0.8153077 }, { "boundingBox": { "maxX": 489, "maxY": 296, "minX": 360, "minY": 272 }, "label": "06-03-2014", "probability": 0.99557674 }, { "boundingBox": { "maxX": 724, "maxY": 296, "minX": 591, "minY": 272 }, "label": "05-21-2019", "probability": 0.9982162 }, { "boundingBox": { "maxX": 342, "maxY": 295, "minX": 273, "minY": 281 }, "label": "ISSUED:", "probability": 0.9975425 }, { "boundingBox": { "maxX": 577, "maxY": 294, "minX": 498, "minY": 280 }, "label": "EXPIRES:", "probability": 0.9983645 }, { "boundingBox": { "maxX": 327, "maxY": 331, "minX": 275, "minY": 317 }, "label": "ENDR:", "probability": 0.99755245 }, { "boundingBox": { "maxX": 558, "maxY": 332, "minX": 496, "minY": 317 }, "label": "RESTR:", "probability": 0.99744886 }, { "boundingBox": { "maxX": 306, "maxY": 368, "minX": 273, "minY": 354 }, "label": "SEX", "probability": 0.9929898 }, { "boundingBox": { "maxX": 359, "maxY": 368, "minX": 323, "minY": 354 }, "label": "HGT", "probability": 0.9968958 }, { "boundingBox": { "maxX": 440, "maxY": 368, "minX": 396, "minY": 354 }, "label": "eyes", "probability": 0.99714917 }, { "boundingBox": { "maxX": 372, "maxY": 392, "minX": 325, "minY": 373 }, "label": "6-10", "probability": 0.99281657 }, { "boundingBox": { "maxX": 447, "maxY": 393, "minX": 397, "minY": 375 }, "label": "BRN", "probability": 0.99728227 }, { "boundingBox": { "maxX": 636, "maxY": 509, "minX": 454, "minY": 494 }, "label": "WL200632600000068", "probability": 0.99342793 }, { "boundingBox": { "maxX": 713, "maxY": 508, "minX": 652, "minY": 495 }, "label": "LRREN", "probability": 0.9964018 }, { "boundingBox": { "maxX": 781, "maxY": 509, "minX": 736, "minY": 494 }, "label": "24.00", "probability": 0.9942861 } ] }';
			}
			when else {
				jsonStr = '';
			}
		}

		JSONParser parser = JSON.createParser(jsonStr);
		retVal = (Einstein_PredictionResult)parser.readValueAs(Einstein_PredictionResult.class);
		return retVal;
	}

    global IDResult parseResults (String idClass, Einstein_PredictionResult sortedResult) {

		IDResult idResult = new IDResult();

		// Raw prediction has been made.  Now to find the interesting values in it
		// Parsing is unique for each state
		switch on idClass {
			when 'NewYorkState1' {
				idResult = newYorkState1 (sortedResult);
			}
			when 'NewYorkState2' {
				idResult = newYorkState2 (sortedResult);
			}
			when 'California' {
				idResult = california (sortedResult);
			}
			when 'NewJersey' {
				idResult = newJersey (sortedResult);
			}
			when else {
				throw new AuraHandledException('State not supported');
			}
		}

		return idResult;
	}


	private static IDResult newYorkState1 (Einstein_PredictionResult sortedResult) {
		IDResult idResult = new IDResult();

		Integer index;
		index = IDReader_Controller.find(sortedResult, 'name');
		idResult.lastName = IDReader_Controller.getLabel(sortedResult, index+1).toLowerCase().capitalize();
		idResult.firstName = IDReader_Controller.getLabel(sortedResult, index+2).toLowerCase().capitalize();

		index = IDReader_Controller.find(sortedResult, 'address');
		idResult.streetAddress = 
			IDReader_Controller.getLabel(sortedResult, index+1) + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+2).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+3).toLowerCase().capitalize();
		idResult.cityAddress =
			IDReader_Controller.getLabel(sortedResult, index+5).toLowerCase().capitalize();
		idResult.stateAddress =
			IDReader_Controller.getLabel(sortedResult, index+6).toUppercase();
		idResult.zipCode =
			IDReader_Controller.getLabel(sortedResult, index+9);

		index = IDReader_Controller.find(sortedResult, 'organ');
		idResult.isOrganDonor = (index > 0);
		if (idResult.isOrganDonor) {
			String s2 = IDReader_Controller.getLabel(sortedResult, index);
		}

		return idResult;
		
	} 

	private static IDResult newYorkState2 (Einstein_PredictionResult sortedResult) {
		IDResult idResult = new IDResult();

		Integer index;
		index = IDReader_Controller.find(sortedResult, 'class');
		idResult.lastName = IDReader_Controller.getLabel(sortedResult, index+1).toLowerCase().capitalize();
		idResult.firstName = IDReader_Controller.getLabel(sortedResult, index+3).toLowerCase().capitalize();

		idResult.streetAddress = 
			IDReader_Controller.getLabel(sortedResult, index+5) + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+6).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+7).toLowerCase().capitalize();
		idResult.cityAddress =
			IDReader_Controller.getLabel(sortedResult, index+8).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+9).toLowerCase().capitalize();
		idResult.stateAddress =
			IDReader_Controller.getLabel(sortedResult, index+10).toUppercase();
		idResult.zipCode =
			IDReader_Controller.getLabel(sortedResult, index+11);
		index = IDReader_Controller.find(sortedResult, 'organ');
		idResult.isOrganDonor = (index > 0);
		if (idResult.isOrganDonor) {
			String s2 = IDReader_Controller.getLabel(sortedResult, index);
		}
		index = IDReader_Controller.find(sortedResult, 'DOB');
		String s = IDReader_Controller.getLabel(sortedResult, index-1);
		// MM/DD/YYYY
		idResult.dob = s.substringAfterLast('/') + '-' + s.substringBefore('/') + '-' + s.substringBetween('/');

		return idResult;
		
	}

	private static IDResult california (Einstein_PredictionResult sortedResult) {
		IDResult idResult = new IDResult();

		Integer index;
		//
		index = IDReader_Controller.find(sortedResult, 'LN');
		idResult.lastName = IDReader_Controller.getLabel(sortedResult, index+1).toLowerCase().capitalize();
		index = IDReader_Controller.find(sortedResult, 'FIN');
		idResult.firstName = IDReader_Controller.getLabel(sortedResult, index+1).toLowerCase().capitalize();

		idResult.streetAddress = 
			IDReader_Controller.getLabel(sortedResult, index+2) + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+3).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+4).toLowerCase().capitalize();
		idResult.cityAddress =
			IDReader_Controller.getLabel(sortedResult, index+5).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+6).toLowerCase().capitalize();
		idResult.stateAddress =
			IDReader_Controller.getLabel(sortedResult, index+7).toUppercase();
		idResult.zipCode =
			IDReader_Controller.getLabel(sortedResult, index+8);
		String s = IDReader_Controller.getLabel(sortedResult, index+10);
		// MM/DD/YYYY
		idResult.dob = s.substringAfterLast('/') + '-' + s.substringBefore('/') + '-' + s.substringBetween('/');
			
		index = IDReader_Controller.find(sortedResult, 'donor');
		idResult.isOrganDonor = (index > 0);
		if (idResult.isOrganDonor) {
			String s2 = IDReader_Controller.getLabel(sortedResult, index);
		}

		return idResult;
		
	}

	private static IDResult newJersey (Einstein_PredictionResult sortedResult) {
		IDResult idResult = new IDResult();

		Integer index;
		//
		index = IDReader_Controller.find(sortedResult, 'DOB:');
		String s = IDReader_Controller.getLabel(sortedResult, index-3);
		// In the form MM-DD-YYYY
		idResult.dob = s.substringAfterLast('-') + '-' + s.substringBefore('-') + '-' + s.substringBetween('-');
		idResult.firstName = IDReader_Controller.getLabel(sortedResult, index+1).toLowerCase().capitalize();
		idResult.lastName = IDReader_Controller.getLabel(sortedResult, index+2).toLowerCase().capitalize();

		idResult.streetAddress = 
			IDReader_Controller.getLabel(sortedResult, index+3) + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+4).toLowerCase().capitalize() + ' ' +
			IDReader_Controller.getLabel(sortedResult, index+5).toLowerCase().capitalize();
		idResult.cityAddress =
			IDReader_Controller.getLabel(sortedResult, index+6).toLowerCase().capitalize();
		idResult.stateAddress =
			IDReader_Controller.getLabel(sortedResult, index+7).toUppercase();
		idResult.zipCode =
			IDReader_Controller.getLabel(sortedResult, index+8);
		index = IDReader_Controller.find(sortedResult, 'donor');
		idResult.isOrganDonor = (index > 0);
		if (idResult.isOrganDonor) {
			String s2 = IDReader_Controller.getLabel(sortedResult, index);
		}
	
		return idResult;		
	}

}