module ResistanceDistance

using Graphs: laplacian_matrix,nv
using LinearAlgebra: pinv,det

"""
    resistance_distance_matrix(g)

Calculate the resistance distance matrix for a graph.

# Arguments
- `g`: The graph for which the resistance distance matrix is to be calculated.

# Returns
- A matrix where the element at the i-th row and j-th column represents the resistance distance between nodes `i` and `j`. 

# Notes
- The resistance distance matrix is calculated using the formula for resistance distance in terms of the Laplacian matrix of the graph.
- The Laplacian matrix of the graph is calculated using the `laplacian_matrix` function.
- The pseudoinverse of the Laplacian matrix is calculated using the `pinv` function from the LinearAlgebra module.
"""
function resistance_distance_matrix(g)
    il=pinv(Matrix(laplacian_matrix(g)))
    out=zeros(Float64,(nv(g),nv(g)))
    for i in axes(out,1)
        for j in axes(out,2)
            if j>=i
                break
            end
            out[i,j]=il[i,i]+il[j,j]-2il[i,j]
            out[j,i]=out[i,j]
        end
    end
    return out
end

"""
    resistance_distance(g, i::Int64, j::Int64)

Calculate the resistance distance between two nodes in a graph.

# Arguments
- `g`: The graph in which the resistance distance is to be calculated.
- `i`: The first node.
- `j`: The second node.

# Returns
- The resistance distance between nodes `i` and `j`.

# Notes
- Implements:
Bapat, Ravindra B., Gutmana, Ivan and Xiao, Wenjun. "A Simple Method for Computing Resistance Distance" Zeitschrift für Naturforschung A, vol. 58, no. 9-10, 2003, pp. 494-498. https://doi.org/10.1515/zna-2003-9-1003
"""
function resistance_distance(g,i::Int64,j::Int64)
    if i==j
        return 0
    end
    lg=laplacian_matrix(g)
    return det(@view lg[setdiff(1:end, [i,j]), setdiff(1:end, [i,j])])/det(@view lg[setdiff(1:end, i), setdiff(1:end, i)])
end

end