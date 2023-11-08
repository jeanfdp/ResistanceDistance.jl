# ResistanceDistance.jl

This is a Julia package for calculating the resistance distance matrix of a graph.

## Installation

To install the package, use the following command in the Julia package manager:

```julia
using Pkg
Pkg.add("ResistanceDistance")
```

## Usage

This package provides functions to calculate resistance distances in a graph. You can use the following functions in your Julia code:

### `resistance_distance_matrix(g)`

This function calculates the resistance distance matrix for a given graph, which represents the resistance distances between all pairs of nodes in the graph.

#### Arguments

- `g`: The graph for which the resistance distance matrix is to be calculated.

#### Returns

- A matrix where the element at the i-th row and j-th column represents the resistance distance between nodes `i` and `j`.

#### Example

```julia
using Graphs,ResistanceDistance

# Create a graph (replace with your own graph creation code)
g = ladder_graph(4)

# Calculate the resistance distance matrix
matrix = resistance_distance_matrix(g)
println(matrix)
```

### `resistance_distance(g, i::Int64, j::Int64)`

This function calculates the resistance distance between two nodes in a graph.

#### Arguments

- `g`: The graph in which the resistance distance is to be calculated.
- `i`: The first node.
- `j`: The second node.

#### Returns

- The resistance distance between nodes `i` and `j`.

#### Example

```julia
using Graphs,ResistanceDistance

# Create a graph (replace with your own graph creation code)
g = ladder_graph(4)

# Calculate the resistance distance between nodes 1 and 5
distance = resistance_distance(g, 1, 5)
println("Resistance Distance between Node 1 and Node 5: $distance")
```

### References

- The package implements the resistance distance calculation method described in the paper: "A Simple Method for Computing Resistance Distance" by Bapat, Ravindra B., Gutman, Ivan, and Xiao, Wenjun. You can find the paper at [this link](https://doi.org/10.1515/zna-2003-9-1003).


[![Build Status](https://github.com/jeanfdp/ResistanceDistance.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/jeanfdp/ResistanceDistance.jl/actions/workflows/CI.yml?query=branch%3Amaster)
