%% Função para Calcular a Manobra Fishhook
function [tempo Saida]=Fishhook(A,t)
tempo=[0:0.01:t];
flag=0;
Saida(1:100)=0;
i=100;
alpha=A/0.25;
while lt(Saida(i),A)
    i=i+1;
    Saida(i)=min(alpha*(tempo(i)-1),A);
end
ref_tempo=tempo(i);
while lt(tempo(i),(ref_tempo+0.25))
    Saida(i)=A;
    i=i+1;
end
ref_tempo=tempo(i);
while gt(Saida(i-1),-A)
    Saida(i)=max(A-alpha*(tempo(i)-ref_tempo),-A);
    i=i+1;
end
ref_tempo=tempo(i);
while lt(tempo(i),(ref_tempo+3))
    Saida(i)=-A;
    i=i+1;
end
ref_tempo=tempo(i);
while lt(Saida(i-1),0)
    Saida(i)=min(-A+(A/4)*(tempo(i)-ref_tempo),0);
    i=i+1;
end
Saida(i:length(tempo))=0;