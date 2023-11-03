using ResistanceDistance,Graphs
using Test

@testset "ResistanceDistance.jl" begin
    @testset "resistance_distance_matrix function" begin
        # Create a test graph
        g = ladder_graph(5)

        # Calculate the resistance distance matrix
        matrix = resistance_distance_matrix(g)

        # Define the expected result
        expected = ...

        # Test that the function returns the expected result
        @test matrix == expected
    end
end
