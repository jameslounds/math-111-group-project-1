a_wins = 0;
a_close_losses = 0;
scores = [6 14];

n = 5000;

for i = 1:n
    result = play_game(scores);

    if result(end, 1) == 20
        a_wins = a_wins + 1;
    elseif sum(result(:, 1) == 19) ~= 0
        a_close_losses = a_close_losses + 1;

    end

end

results = table(a_wins / n, a_close_losses / n);
results.Properties.VariableNames = {'Probability A Wins' 'Probability A Loses Closely'};
table2latex(results, '../tables/coin_game.tex')

result = play_game(scores);
a_scores = result(:, 1);
p = plot(0:size(a_scores) -1, a_scores);
print -deps epsFig
