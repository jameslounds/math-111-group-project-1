function t = coin_occurences_table(prices, coins)
    counts = coins_counts(prices, coins);
    sz = [size(coins, 2) 4];
    varNames = ["Denomination", "0", "1", "2"];
    varTypes = ["double", "double", "double", "double"];
    t = table('Size', sz, 'VariableTypes', varTypes, 'VariableNames', varNames);

    t(:, 1) = table(reshape(coins, [size(coins, 2) 1]));

    for i = 1:3
        t(:, i + 1) = table(sum(counts + 1 == i, 2));
    end

end
