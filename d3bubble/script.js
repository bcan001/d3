var width = 800;
var height = 600;

var canvas = d3.select("body").append("svg")
			.attr("height", height)
			.attr("width", width)
			.append("g")
			.attr("transform", "translate(50, 50)");

// var tree = d3.layout.tree()
// 			.size([400,400])

// use pack layout instead of tree layout
var pack = d3.layout.pack()
				.size([width, height - 50])
				.padding(10);


d3.json("data.json", function(data) {
	console.log(data);

	// // use nodes function to get the properties of ALL people (Max all the way to grandchildren)
	// var nodes = tree.nodes(data);
	// // links between each node (contains source AND target for each link)
	// var links = tree.links(nodes);

	// use pack layout instead of tree layout
	var nodes = pack.nodes(data);


	// empty selection nodes
	var node = canvas.selectAll(".node")
				.data(nodes)
				.enter()
				.append("g")
						.attr("class", "node")
						// specify where the nodes are placed on the canvas based on their coordinates
						// to rotate nodes, just switch d.x and d.y values in the translate method
						.attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })


	// // add a circle to each node
	// node.append("circle")
	// 			.attr("r", 5)
	// 			.attr("fill", "blue");

	// // append text to each node
	// node.append("text")
	// 			.text(function (d) { return d.name; })

	// // create diagonal paths between nodes
	// var diagonal = d3.svg.diagonal()
	// 			// rotate
	// 			.projection(function (d) { return [d.x, d.y]; });


	// canvas.selectAll(".link")
	// 			.data(links)
	// 			.enter()
	// 			.append("path")
	// 				.attr("class", "link")
	// 				.attr("fill", "none")
	// 				.attr("stroke", "black")
	// 				.attr("d", diagonal);


	// use pack layout instead of tree
	// the radius is a function of the data (radius of circles is defined by "values" in the json file)
	node.append("circle")
		.attr("r", function (d) { return d.r; })
		//.attr("fill", "blue")
			// create bubble chart fill
		.attr("fill", function (d) { return d.children ? "white" : "blue"; })
		.attr("opacity", 0.25)
		//.attr("stroke", "grey")
			// create bubble chart stroke
		.attr("stroke", function (d) { return d.children ? "white" : "grey"; })
		.attr("stroke-width", "2");

	//add the text to the circles (only child node text)
	node.append("text")
		// if the node has children, only show the children names in the nodes
		.text(function (d) { return d.children ? "" : d.name; })


});			