%% Função para Calcular a Força LAteral em Função do Ângulos de Deriva
function [tempo Saida]=Fishhook(A,t)
tempo=[0:0.01:t];
for i=1:length(tempo)
    if (tempo(i)<1)
        Saida(i)=0;
    end
    if (tempo(i)>=1) && (tempo(i)<1.25)
        Saida(i)=720*(tempo(i)-1);
    end
    if (tempo(i)>=1.25) && (tempo(i)<1.5)
        Saida(i)=A;
    end
    if (tempo(i)>=1.5) && (tempo(i)<2.0)
        Saida(i)=A-720*(tempo(i)-1.5);
    end
    if (tempo(i)>=2.0) && (tempo(i)<5.0)
        Saida(i)=-A;
    end
    if (tempo(i)>=5.0) && (tempo(i)<9.0)
        Saida(i)=-A+45*(tempo(i)-5);
    end
    if (tempo(i)>=9.0)
        Saida(i)=0;
    end
end