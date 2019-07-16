stamp_depth = 3;
curve_steps = 50;
grip_height = 40;
grip_radius = 10;
stamp_radius = 20;
$fs = 0.5;
$fa = 1;

/*
color([0, 1, 1]) {
	linear_extrude(height=stamp_depth) {
		scale(0.06) {
			figures();
		}
	}
}
translate([0, 0, stamp_depth]) {
	cylinder(r=stamp_radius, h=5);
}*/


module figures()
    polygon(
        points=
            [[140.569, -109.462], [117.188, -104.419], [87.665, -132.271], [91.479, -137.456], [88.468, -142.195], [84.916, -146.223], [80.906, -149.668], [76.517, -152.659], [71.833, -155.323], [66.935, -157.79], [56.821, -162.64], [59.076, -165.189], [60.093, -166.204], [61.183, -166.859], [65.424, -168.716], [69.248, -170.988], [72.688, -173.637], [75.779, -176.626], [78.555, -179.915], [81.049, -183.467], [85.327, -191.207], [87.388, -196.012], [89.161, -200.955], [92.481, -210.949], [94.398, -217.186], [96.372, -223.395], [97.627, -226.371], [99.191, -229.198], [101.163, -231.83], [103.641, -234.219], [104.305, -236.809], [105.37, -239.072], [106.756, -241.077], [108.381, -242.894], [112.022, -246.235], [115.642, -249.643], [117.418, -251.898], [118.687, -254.287], [119.488, -256.786], [119.861, -259.376], [119.846, -262.033], [119.482, -264.737], [117.869, -270.195], [114.091, -280.414], [112.343, -281.646], [110.516, -282.165], [108.627, -282.158], [106.691, -281.808], [102.738, -280.823], [100.753, -280.558], [98.782, -280.692], [92.403, -285.156], [85.933, -288.451], [79.518, -290.561], [73.3, -291.468], [70.311, -291.467], [67.426, -291.159], [64.663, -290.543], [62.039, -289.617], [59.573, -288.378], [57.283, -286.825], [55.187, -284.956], [53.303, -282.769], [59.147, -279.115], [64.173, -274.88], [68.473, -270.115], [72.14, -264.869], [75.266, -259.192], [77.942, -253.132], [80.26, -246.74], [82.313, -240.065], [76.595, -232.69], [73.558, -229.037], [70.203, -225.701], [65.063, -221.009], [60.147, -216.124], [50.824, -205.91], [33.108, -184.659], [27.663, -178.067], [22.555, -171.289], [18.168, -164.095], [16.365, -160.269], [14.885, -156.253], [6.76, -158.107], [3.943, -158.373], [1.591, -158.096], [-0.568, -157.203], [-2.807, -155.619], [-8.616, -150.078], [-27.488, -130.436], [-33.832, -124.427], [-40.418, -118.452], [-45.588, -121.632], [-50.925, -124.212], [-56.4, -126.306], [-61.984, -128.031], [-73.363, -130.829], [-84.831, -133.528], [-92.246, -165.968], [-96.918, -186.921], [-101.988, -207.769], [-103.295, -213.134], [-104.261, -218.496], [-104.81, -223.899], [-104.867, -229.383], [-104.944, -233.27], [-105.191, -237.306], [-108.464, -238.02], [-111.784, -238.374], [-118.507, -238.668], [-121.881, -238.942], [-125.245, -239.522], [-128.585, -240.576], [-131.887, -242.269], [-129.416, -243.958], [-127.31, -245.093], [-92.28, -256.349], [-89.529, -257.171], [-86.968, -258.188], [-84.794, -259.767], [-83.915, -260.882], [-83.205, -262.275], [-84.147, -264.994], [-85.845, -266.931], [-88.034, -268.261], [-90.449, -269.159], [-100.003, -271.644], [-109.684, -273.388], [-119.462, -274.457], [-129.31, -274.922], [-133.437, -274.778], [-137.581, -274.312], [-145.953, -273.146], [-151.019, -278.63], [-157.478, -279.144], [-163.942, -278.781], [-170.445, -277.86], [-177.018, -276.699], [-178.178, -272.502], [-178.986, -268.363], [-179.392, -264.284], [-179.345, -260.269], [-178.794, -256.32], [-177.687, -252.44], [-175.974, -248.632], [-173.604, -244.9], [-171.04, -240.705], [-169.307, -236.278], [-168.354, -231.633], [-168.13, -226.782], [-168.001, -223.909], [-167.47, -221.184], [-166.547, -218.552], [-165.245, -215.962], [-163.537, -211.945], [-163.068, -209.796], [-162.938, -207.679], [-162.686, -199.292], [-161.548, -191.077], [-159.709, -182.99], [-157.357, -174.988], [-157.201, -173.696], [-157.206, -172.252], [-165.643, -162.779], [-163.385, -156.526], [-164.1, -155.351], [-164.887, -154.349], [-168.718, -151.646], [-172.898, -149.756], [-177.297, -148.458], [-181.782, -147.527], [-184.865, -146.678], [-187.528, -145.364], [-189.872, -143.604], [-192.001, -141.419], [-195.777, -136.578], [-199.121, -131.458], [-202.148, -126.103], [-204.974, -120.552], [-203.522, -119.619], [-202.123, -119.086], [-200.78, -118.9], [-199.5, -119.008], [-197.143, -119.894], [-195.089, -121.318], [-191.6, -123.728], [-188.057, -125.345], [-184.466, -126.27], [-180.831, -126.601], [-177.159, -126.437], [-173.453, -125.876], [-165.963, -123.961], [-165.386, -123.446], [-164.877, -122.707], [-164.978, -121.814], [-165.243, -121.1], [-169.301, -116.976], [-172.965, -112.585], [-176.308, -107.978], [-179.4, -103.203], [-185.126, -93.343], [-190.718, -83.399], [-200.083, -67.495], [-209.78, -51.81], [-220.008, -36.47], [-230.971, -21.598], [-233.371, -18.255], [-235.46, -14.78], [-237.244, -11.182], [-238.733, -7.465], [-239.935, -3.638], [-240.856, 0.295], [-241.891, 8.449], [-242.051, 18.798], [-241.236, 29.008], [-239.423, 39.1], [-236.591, 49.097], [-230.194, 69.141], [-224.619, 89.419], [-222.513, 95.536], [-219.568, 101.027], [-216.001, 106.128], [-212.029, 111.073], [-198.413, 128.264], [-185.106, 145.707], [-184.842, 146.446], [-184.79, 147.005], [-195.555, 150.344], [-200.826, 152.175], [-205.852, 154.454], [-210.962, 156.659], [-216.183, 158.864], [-218.586, 160.287], [-220.718, 162.097], [-222.477, 164.421], [-223.765, 167.388], [-222.41, 171.263], [-220.43, 174.684], [-217.901, 177.821], [-214.898, 180.844], [-210.805, 184.386], [-206.533, 187.514], [-202.094, 190.268], [-197.5, 192.686], [-192.765, 194.808], [-187.899, 196.672], [-177.828, 199.78], [-173.654, 201.12], [-169.558, 202.706], [-165.592, 204.622], [-164.327, 205.619], [-163.485, 206.742], [-163.027, 208.062], [-162.912, 209.654], [-163.547, 213.946], [-164.017, 217.909], [-163.755, 221.947], [-162.814, 225.951], [-161.243, 229.812], [-159.092, 233.42], [-156.411, 236.667], [-153.252, 239.443], [-149.663, 241.64], [-143.816, 234.852], [-143.816, 227.327], [-143.736, 227.458], [-143.751, 227.307], [-144.097, 226.706], [-146.322, 224.13], [-147.814, 221.263], [-148.615, 218.148], [-148.765, 214.832], [-148.867, 210.719], [-149.559, 206.994], [-150.799, 203.628], [-152.548, 200.591], [-154.765, 197.856], [-157.41, 195.393], [-160.444, 193.172], [-163.826, 191.165], [-167.622, 189.076], [-171.257, 186.708], [-174.527, 183.75], [-175.963, 181.953], [-177.231, 179.892], [-173.442, 179.714], [-169.964, 180.342], [-163.523, 182.642], [-154.101, 186.26], [-144.832, 190.244], [-142.177, 191.258], [-139.577, 191.856], [-137.026, 192.07], [-134.517, 191.927], [-132.043, 191.457], [-129.6, 190.688], [-124.776, 188.371], [-112.834, 181.374], [-97.683, 188.979], [-99.257, 192.784], [-101.154, 196.865], [-102.74, 200.31], [-103.787, 203.71], [-104.303, 207.068], [-104.297, 210.385], [-103.778, 213.661], [-102.754, 216.898], [-101.233, 220.097], [-99.226, 223.26], [-92.349, 232.373], [-89.534, 235.62], [-86.476, 238.238], [-83.195, 240.259], [-79.712, 241.718], [-76.049, 242.649], [-72.227, 243.086], [-68.267, 243.063], [-64.191, 242.613], [-58.427, 241.486], [-52.714, 240.038], [-41.351, 236.808], [-39.443, 236.124], [-37.802, 235.215], [-36.411, 234.095], [-35.253, 232.78], [-33.567, 229.623], [-32.604, 225.862], [-30.127, 212.575], [-29.254, 205.869], [-29.171, 199.021], [-28.938, 196.583], [-28.124, 194.102], [-25.925, 189.178], [-24.106, 185.415], [-22.398, 182.263], [-23.003, 180.735], [-23.808, 179.661], [-25.825, 178.446], [-28.075, 177.754], [-30.178, 176.721], [-35.071, 169.339], [-36.599, 163.541], [-37.873, 160.896], [-40.033, 157.7], [-44.469, 157.947], [-48.686, 157.645], [-52.938, 156.473], [-57.481, 154.112], [-62.752, 150.393], [-67.876, 146.524], [-63.801, 124.139], [-65.736, 121.827], [-67.835, 120.001], [-69.564, 118.037], [-70.123, 116.807], [-70.388, 115.308], [-70.83, 112.083], [-71.728, 109.132], [-73.031, 106.43], [-74.689, 103.952], [-76.649, 101.673], [-78.861, 99.569], [-83.836, 95.788], [-87.773, 93.051], [-91.418, 90.079], [-94.578, 86.574], [-95.917, 84.526], [-97.062, 82.232], [-98.589, 79.774], [-100.712, 77.567], [-105.485, 73.441], [-108.519, 70.967], [-111.687, 68.619], [-109.541, 66.548], [-106.548, 64.133], [-98.857, 58.799], [-90.283, 53.671], [-82.492, 49.805], [-72.156, 51.461], [-68.778, 51.492], [-65.598, 50.826], [-62.67, 49.457], [-60.049, 47.379], [-57.203, 45.124], [-54.111, 43.675], [-50.796, 42.906], [-47.281, 42.692], [4.64, 43.125], [7.976, 43.304], [10.699, 43.737], [12.898, 44.479], [14.66, 45.587], [16.074, 47.119], [17.228, 49.131], [19.107, 54.823], [20.358, 58.039], [22.294, 60.893], [24.851, 64.277], [26.864, 67.905], [28.392, 71.743], [29.495, 75.758], [31.005, 80.654], [33.205, 85.112], [36.032, 89.206], [39.42, 93.009], [43.388, 97.536], [47.075, 102.14], [44.672, 111.607], [46.713, 113.356], [48.78, 114.648], [72.159, 122.012], [77.697, 124.285], [82.642, 127.354], [86.959, 131.256], [90.613, 136.025], [90.318, 138.263], [89.714, 140.197], [88.821, 141.854], [87.662, 143.261], [86.26, 144.445], [84.637, 145.433], [80.818, 146.926], [75.68, 148.734], [71.038, 150.577], [71.038, 170.691], [66.481, 174.974], [66.95, 176.172], [67.592, 177.184], [71.476, 180.843], [74.506, 184.927], [75.627, 187.186], [76.446, 189.62], [76.933, 192.253], [77.057, 195.106], [77.308, 197.158], [78.0, 199.222], [79.822, 203.31], [82.487, 209.576], [84.915, 215.994], [86.878, 218.629], [89.376, 220.444], [92.293, 221.682], [95.514, 222.582], [103.944, 224.024], [105.884, 224.634], [107.649, 225.549], [109.184, 226.87], [110.436, 228.701], [121.586, 223.655], [126.737, 220.923], [131.407, 217.637], [135.725, 213.619], [139.825, 209.19], [148.267, 199.578], [147.332, 194.931], [150.613, 190.695], [152.957, 186.097], [153.732, 183.658], [154.219, 181.123], [154.401, 178.489], [154.258, 175.754], [154.078, 172.9], [154.219, 170.275], [154.714, 167.874], [155.594, 165.692], [156.888, 163.725], [158.629, 161.968], [160.846, 160.416], [163.572, 159.063], [165.623, 157.954], [167.299, 156.542], [168.587, 154.89], [169.476, 153.059], [169.955, 151.111], [170.013, 149.11], [169.639, 147.116], [168.821, 145.193], [167.475, 143.439], [165.658, 141.836], [161.195, 138.312], [161.332, 135.31], [161.07, 131.611], [160.552, 130.09], [159.762, 128.609], [157.929, 125.583], [160.304, 123.652], [162.911, 122.515], [165.699, 121.926], [168.617, 121.64], [174.641, 121.0], [177.645, 120.155], [180.576, 118.634], [184.318, 111.154], [188.364, 102.636], [189.907, 99.648], [191.812, 97.07], [194.203, 94.986], [197.202, 93.479], [199.86, 92.302], [202.131, 90.721], [203.948, 88.644], [205.245, 85.977], [206.079, 84.481], [207.321, 83.275], [228.864, 68.043], [231.624, 69.435], [234.186, 71.047], [238.801, 74.811], [242.872, 79.097], [246.562, 83.669], [251.888, 90.9], [256.993, 98.301], [266.848, 113.355], [268.489, 116.746], [269.184, 120.305], [268.98, 123.978], [267.922, 127.71], [266.03, 132.625], [264.501, 137.64], [263.771, 141.961], [263.852, 146.283], [265.488, 154.438], [267.475, 162.807], [274.761, 164.085], [279.861, 160.24], [282.495, 145.614], [283.798, 145.38], [286.553, 151.792], [287.813, 150.804], [288.664, 149.756], [289.419, 147.523], [289.373, 145.181], [289.078, 142.816], [288.63, 139.804], [288.539, 138.331], [288.754, 136.96], [289.516, 133.904], [289.81, 130.939], [289.696, 128.052], [289.233, 125.228], [287.494, 119.712], [285.064, 114.274], [279.811, 103.218], [277.368, 97.612], [275.178, 91.919], [272.246, 84.326], [268.907, 77.001], [265.146, 69.941], [260.952, 63.14], [256.313, 56.594], [251.215, 50.3], [245.647, 44.253], [239.595, 38.449], [226.789, 42.61], [214.112, 47.616], [188.672, 58.784], [178.288, 54.699], [164.734, 69.628], [162.804, 67.253], [161.735, 64.905], [161.301, 62.568], [161.273, 60.228], [161.229, 55.113], [160.724, 50.091], [159.849, 45.144], [158.698, 40.254], [153.177, 20.9], [152.144, 18.413], [150.589, 16.077], [147.168, 11.59], [152.048, -4.282], [156.558, -20.243], [157.555, -24.881], [158.238, -29.519], [158.603, -34.157], [158.651, -38.798], [158.379, -43.443], [157.787, -48.095], [156.873, -52.754], [155.635, -57.424], [153.56, -65.226], [151.837, -73.132], [148.702, -89.033], [147.527, -94.38], [146.011, -99.626], [143.807, -104.682], [142.339, -107.112], [140.569, -109.462], [-82.556, 17.083], [-79.986, 13.869], [-77.065, 11.603], [-73.949, 9.977], [-70.798, 8.681], [-55.284, 2.642], [-47.446, -0.135], [-39.517, -2.589], [-34.182, -4.587], [-29.669, -7.378], [-25.919, -11.034], [-22.87, -15.628], [-19.452, -22.75], [-7.366, -49.015], [-5.778, -51.219], [-4.313, -52.728], [10.902, -43.568], [18.338, -39.225], [25.835, -35.164], [28.731, -33.565], [31.193, -31.777], [33.091, -29.593], [34.295, -26.803], [37.327, -25.903], [43.316, -24.316], [48.898, -22.245], [54.041, -19.646], [58.712, -16.475], [62.879, -12.688], [66.509, -8.241], [69.571, -3.09], [72.031, 2.809], [75.46, 11.236], [79.269, 19.606], [76.679, 24.306], [73.628, 28.684], [69.931, 32.59], [65.404, 35.874], [63.974, 37.038], [62.755, 38.564], [60.521, 41.915], [57.417, 46.65], [41.344, 42.04], [27.645, 26.562], [24.628, 23.611], [21.26, 21.304], [17.56, 19.551], [13.547, 18.259], [8.603, 17.233], [3.671, 16.699], [-1.249, 16.582], [-6.153, 16.806], [-15.91, 17.978], [-25.587, 19.61], [-33.209, 21.338], [-40.816, 23.677], [-56.549, 28.971], [-58.816, 26.006], [-61.538, 23.819], [-64.628, 22.233], [-67.999, 21.069], [-75.237, 19.299], [-78.93, 18.336], [-111.279, -59.002], [-89.454, -95.852], [-70.333, -86.508], [-72.101, -84.287], [-73.624, -82.673], [-86.228, -72.617], [-99.078, -62.898], [-101.395, -61.685], [-104.189, -60.826], [23.252, -95.345], [38.151, -113.274], [41.707, -107.409], [45.458, -102.074], [49.052, -96.846], [52.135, -91.302]],
        paths=
            [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 0], [588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 588, 588], [651, 652, 653, 654, 655, 656, 657, 658, 659, 651, 651], [660, 661, 662, 663, 664, 665, 660, 660]]
    );

function curve(i) = grip_radius + (i - curve_steps) * (i - curve_steps) * (stamp_radius - grip_radius) / (curve_steps * curve_steps);

module stamp_grip() {
	for(i = [0:curve_steps]) {
		translate([0, 0, stamp_depth + 5 + i * grip_height / curve_steps]) {
			cylinder(r1=curve(i), r2=curve(i + 1), h=grip_height / curve_steps);
		}
	}
	translate([0, 0, stamp_depth + 5 + grip_height]) {
		sphere(r=grip_radius);
	}
}

stamp_grip();