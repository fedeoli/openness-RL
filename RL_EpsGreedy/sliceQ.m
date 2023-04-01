%%
function sliceQ(obj,iter)

    % slice plot
    [X, Y, Z] = meshgrid(obj.bandit.actValues(2).val,obj.bandit.actValues(3).val,obj.bandit.actValues(1).val);
    V = find_actionval(X,Y,Z,obj,iter);
    a = slice(X,Y,Z,V,[25:25:75], [25:25:75], [0.2:0.1:0.5]);
    set(a,'FaceAlpha' ,0.7);
    colorbar
    shading interp

    % actions plot
    hold on
    for a=1:size(obj.bandit.actNuples,1)
        plot3(obj.bandit.actNuples(a,2),obj.bandit.actNuples(a,3),obj.bandit.actNuples(a,1),'ro','MarkerSize',5,'MarkerFaceColor','r');
        text(obj.bandit.actNuples(a,2),obj.bandit.actNuples(a,3),obj.bandit.actNuples(a,1),num2str(obj.meansEst(a,iter)),'VerticalAlignment','top','HorizontalAlignment','center');
    end

    % labels
    xlabel('FFP2')
    ylabel('Surgical')
    zlabel('AER')
    xticks([25 50 75]);
    yticks([25 50 75]);
    zticks([0.2 0.5]);
    set(gca,'fontsize', 15) 

end