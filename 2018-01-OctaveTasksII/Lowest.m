function ans = Lowest(Price)
	ans_set = [ 1 1 1 1 1 1 1 1 1 1 1 1 ];
	for i = 1:12
		ans_now = 999;
		for j = 1:10
			ans_temp = Price(j,i+1) - Price(j,i);
			if ans_temp < ans_now
				ans_now = ans_temp;
				ans_set(i) = j;
			endif
		endfor
	endfor
	ans = ans_set;
end
