sm_purchases = 0:99;
coins = [50 20 10 5 2 1];

table2latex(coin_occurences_table(sm_purchases, coins), '../tables/coin_occurence_normal.tex')
table2latex(coin_number_distribution_table(sm_purchases, coins), '../tables/coin_distributioin_normal.tex')

prices = 5 * 0:19;
coins = [50 20 10 5];
table2latex(coin_occurences_table(prices, coins), '../tables/coin_occurence_no_2_1.tex')
table2latex(coin_number_distribution_table(prices, coins), '../tables/coin_distribution_no_2_1.tex')
