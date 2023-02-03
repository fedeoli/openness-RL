%% plot test
function plot_recap(eg)

    set(0,'DefaultFigureWindowStyle','docked'); 

    % plot Q
    figure();
    hold on
    grid on
    for i=1:eg.bandit.nActs
        plot(eg.meansEst(i,:))
    end
    xlabel('iteration')
    ylabel('Q');
    legend;

    % plot R
    figure();
    hold on
    grid on
    plot(eg.bandit.reward);
    xlabel('iteration')
    ylabel('R');    

    % plot epsilon
    figure();
    hold on
    grid on
    plot(eg.eps)
    xlabel('iteration')
    ylabel('epsilon'); 

    % plot actions choices
    a = [1:eg.bandit.nActs]'.*(diff(eg.meansEst,1,2) ~= 0);
    figure();
    hold on
    grid on
    for i=1:eg.bandit.nActs
        plot(a(i,:),'o')
    end    
    ylim([0.2 3])
    xlabel('iteration')
    ylabel('A'); 
    legend

    % plot rewards per action
    figure();
    hold on
    grid on
    for i=1:eg.bandit.nActs
        subplot(eg.bandit.nActs,1,i);
        data = eg.bandit.reward(a(i,:)~=0);        
        plot(data);
        hold on
        plot(mean(data)*ones(1,length(data)),'LineWidth',2);
        ylabel('R_a'); 
    end  
    xlabel('iteration')    
    legend
end