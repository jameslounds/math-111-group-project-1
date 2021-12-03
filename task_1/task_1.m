sm_purchases = 0:99;
coins = [50 20 10 5 2 1];

table2latex(coin_occurences_table(sm_purchases, coins), '../tables/coin_occurence_normal.tex')
table2latex(coin_number_distribution_table(sm_purchases, coins), '../tables/coin_distributioin_normal.tex')

prices = 5 * 0:19;
coins = [50 20 10 5];
table2latex(coin_occurences_table(prices, coins), '../tables/coin_occurence_no_2_1.tex')
table2latex(coin_number_distribution_table(prices, coins), '../tables/coin_distribution_no_2_1.tex')

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

function counts = coins_counts(prices, coins)
    % preallocation
    counts = zeros(size(coins, 2), size(prices, 2));

    for i = 1:size(coins, 2)
        coinValue = coins(i);
        n = fix(prices / coinValue);
        counts(i, :) = n;
        prices = prices - (n * coinValue);
    end

end
