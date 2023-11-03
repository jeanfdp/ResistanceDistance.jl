module ResistanceDistance

using Graphs: laplacian_matrix,nv
using LinearAlgebra: pinv

function resistance_distance_matrix(g)
    il=pinv(laplacian_matrix(g))
    out=zeros(Float64,(nv(g),nv(g)))
    for i in axes(out,1)
        if j>=i
            continue
        end
        for j in axes(out,2)
            out[i,j]=il[i,i]+il[jj]-2il[i,j]
            out[j,i]=out[i,j]
        end
    end
end

end
