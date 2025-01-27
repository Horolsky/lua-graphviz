Lua-Graphviz
===

[Graphviz](http://www.graphviz.org/) for [Lua](https://lua.org)

## usage
```lua
local Graphviz = require("graphviz")

local graph = Graphviz()
```

## install
`luarocks install graphviz` or `git clone https://github.com/nymphium/lua-graphviz && cd lua-graphviz && luarocks make`

## function
### `graph:node(nodename, label)`
add a node

### `graph:edge(...)`
add edges

link the first given node to each consequent:
```
args[1] -> args[2]
args[1] -> args[3]
...
args[1] -> args[n]
```

### `graph:add_nodes(t)`
add nodes from the table t

Expression `graph:add_nodes({a="b", 42})` is equivalent to `graph:node("a", "b"):node(1, 42)`

### `graph:add_edges(...)`
add a variadic number of edge sets

Expression `graph:add_edges({"a", "b"}, {1,2,3})` is equivalent to `graph:edge("a", "b"):edge(1, 2, 3)`

### `graph:source()`
return graph as string

```
digraph {
	graph []
	node []
	edge []
		a [label="hoge"]
		b [label="huga"]
			a -> b
}
```

### `graph:write(filename)`
write dot file to (`filename`)

### `graph:compile(filename, format = "pdf", generated_filename = ("%s.%s"):format(filename, format))`
write dot file to (`filename`) and compile the file (`dot -T format filename generated_filename`)

### `graph:render(filename, format = "pdf", generated_filename = ("%s.%s"):format(filename,  format))`
write dot file to (`filename`), compile the dot file as `format`, and open the generated file

it only calls `graph:write(filename)`, `graph:compile(filename, format, generated_file)` and `io.pcall(()"xdg-open %s &"):format(generated_filename))`

```lua
graph:render("file", "pdf")
```

### `graph.nodes.style:update(styles)`, `graph.edges.style:update(styles`, `graph.graph.style:update(styles)`

update each style

```lua
graph.nodes.style:update{
	fontname = "Inconsolata Regular",
	shape = "rectangle"
}
```

## LICENSE
[MIT](https://github.com/nymphium/lua-graphviz/tree/master/LICENSE)
