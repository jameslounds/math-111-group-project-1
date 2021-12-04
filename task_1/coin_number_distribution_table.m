function t = coin_number_distribution_table(prices, coins)
    counts = coins_counts(prices, coins);
    sz = [7 2];
    varNames = ["Occurences", "Probability (%)"];
    varTypes = ["double", "double"];
    t = table('Size', sz, 'VariableTypes', varTypes, 'VariableNames', varNames);
    t(:, 1) = table([0; 1; 2; 3; 4; 5; 6]);

    for i = 0:6
        t(i + 1, 2) = table(sum(sum(counts, 1) == i, 2) / (size(prices, 2) / 100));
    end
end
