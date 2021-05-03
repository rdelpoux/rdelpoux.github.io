%DataVisu;
% Scipt DataVisu to be called or copy & past within the picgui script 
Tserial = 5e-4;
if ~ishandle(50) figure(50); end % new fig
set(0,'CurrentFigure',50);  % select fig
[A, tUart] = picgui.padr(Rn,7,t_Rn);  % sample on last column data received (remove NaN numbers from the original matrix)
  
if ~isempty(A)
    clf 
    t = ([0:(length(A)-1)]  + tUart(1))*Tserial; % Do not rely on UART data arrival timestamp. Recreate time vector
    subplot(3,1,1); plot(t,A(:,2:3)); axis tight; ylabel('v_d_q (in V)'); ylim([0 12]);    
    subplot(3,1,2); plot(t,A(:,4:5)); axis tight; ylabel('i_d_q (in A)'); ylim([0 4]);
    subplot(3,1,3); plot(t,A(:,6)); axis tight; ylabel('om (in rad/s)'); ylim([0 300]);
    xlabel('time (in s)')
    dim=[0 .9 .1 .1] ;
    if(A(end,1)==0)
    annotation('textbox',dim,'String',sprintf('Mode = OFF'));
    elseif(A(end,1)==1)
    annotation('textbox',dim,'String',sprintf('Mode = BO'));
    elseif(A(end,1)==2)
    annotation('textbox',dim,'String',sprintf('Mode = Current'));
    elseif(A(end,1)==3)
    annotation('textbox',dim,'String',sprintf('Mode = Speed'));
    end      
end
 