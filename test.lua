package.path = './?.lua;' .. package.path
local Graph = require('graphviz')

local graph = Graph()

graph.nodes.style:update{
	fontname = "Inconsolata Regular",
	shape = "rectangle"
}

graph:node("a", "hoge")
graph:node("b", "huga")
graph:add_nodes({lol=42, 11, kek=13, 4, 5, 6})

graph:edge("a", "b")
graph:add_edges({1, 2, 4}, {"lol", "kek"})
print(graph:source())

graph:render("test")

