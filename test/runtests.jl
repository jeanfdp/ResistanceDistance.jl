using ResistanceDistance,Graphs
using Test

@testset "ResistanceDistance.jl" begin
    @testset "resistance_distance_matrix function" begin
        # Create a test graph
        g = ladder_graph(2)

        # Calculate the resistance distance matrix
        matrix = resistance_distance_matrix(g)

        # Define the expected result
        expected = [0.0   0.7500000000000001  0.7499999999999999  0.9999999999999998
        0.7500000000000001  0.0   0.9999999999999999   0.7499999999999996
        0.7499999999999999  0.9999999999999999   0.0   0.7499999999999999
        0.9999999999999998   0.7499999999999996  0.7499999999999999  0.0]

        # Test that the function returns the expected result
        @test matrix == expected
    end

    @testset "resistance_distance function" begin
        # Create a test graph
        g = ladder_graph(2)

        # Calculate the resistance distance between nodes 1 and 2
        distance = resistance_distance(g,1,2)

        # Define the expected result
        expected = 0.75

        # Test that the function returns the expected result
        @test distance == expected
    end
end
