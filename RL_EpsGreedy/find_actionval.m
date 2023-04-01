%% 
function V = find_actionval(x,y,z,obj,pos)
    tab = obj.bandit.actNuples;

    V = zeros(size(x));

    for i=1:size(V,1)
        for j=1:size(V,2)
            for k=1:size(V,3)
                try
                    id = find((tab(:,2) == x(i,j,k)).*(tab(:,3) == y(i,j,k)).*(tab(:,1) == z(i,j,k)));
                    V(i,j,k) = obj.meansEst(id,pos);
                catch
                    V(i,j,k) = min(obj.meansEst(:,pos));
                end
            end
        end
    end    
    
end