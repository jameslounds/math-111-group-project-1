a_wins = 0;
a_close_losses = 0;
scores = [[6 14]; ];

for i = 1:5000
    result = play_game(scores);

    if result(end, 1) == 20
        a_wins = a_wins + 1;

    elseif sum(result(:, 1) == 19) ~= 0
        a_close_losses = a_close_losses + 1;
    end

end

a_wins
a_close_losses
