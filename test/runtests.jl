using ResistanceDistance,Graphs
using Test

# Define a custom tolerance
tolerance = 1e-6

@testset "ResistanceDistance.jl" begin
    @testset "resistance_distance_matrix function" begin
        # Create a test graph
        g = ladder_graph(2)

        # Calculate the resistance distance matrix
        matrix = resistance_distance_matrix(g)

        # Define the expected result
        expected = [0.0   0.75  0.75  1.0
        0.75  0.0   1.0   0.75
        0.75  1.0   0.0   0.75
        1.0   0.75  0.75  0.0]

        # Test that the function returns the expected result
        @test isapprox(matrix, expected, atol=tolerance)
    end

    @testset "resistance_distance function" begin
        # Create a test graph
        g = ladder_graph(2)

        # Calculate the resistance distance between nodes 1 and 2
        distance = resistance_distance(g,1,2)

        # Define the expected result
        expected = 0.75

        # Test that the function returns the expected result
        @test isapprox(distance, expected, atol=tolerance)
    end
end
