module ResistanceDistance

using Graphs: laplacian_matrix,nv
using LinearAlgebra: pinv

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

end
