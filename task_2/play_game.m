function scores = playGame(initialScores)
    scores = initialScores;

    while sum(scores <= 0) == 0
        flip = 2 * randi([0 1], 1) - 1;

        scores(end + 1, :) = scores(end, :) + flip * [1 -1];
    end

end