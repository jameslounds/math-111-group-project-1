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
