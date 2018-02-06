function ans = Lowest(Price)
	ans_temp = 1000000;
	ans_set = [ 1 1 1 1 1 1 1 1 1 1 1 1 ];
	i = 1;
	j = 1;
	k = 1;
	l = 1;
	m = 1;
	n = 1;
	o = 1;
	p = 1;
	q = 1;
	r = 1;
	s = 1;
	t = 1;
	ans_temp = 1000000;
	for i = 1:10
		ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
		if ans_now < ans_temp
			ans_set(1) = i;
			and_temp = ans_now;
		endif
	endfor
	ans_temp = 1000000;
        for j = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(2) = j;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for k = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(3) = k;
			and_temp = ans_now;
                endif
        endfor
        ans_temp = 1000000;
	for l = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(4) = l;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for m = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(5) = m;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for n = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(6) = n;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for o = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(7) = o;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for p = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(8) = p;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for q = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(9) = q;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for r = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(10) = r;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for s = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(11) = s;
			and_temp = ans_now;
                endif
        endfor
	ans_temp = 1000000;
        for t = 1:10
                ans_now = Yield(Price, [ i j k l m n o p q r s t ]);
                if ans_now < ans_temp
                        ans_set(12) = t;
			and_temp = ans_now;
                endif
        endfor
	ans = ans_set;
end
