function ans_set = Lowest(Price)
	ans = 100000000000
	for i = 1:10
		for j = 1:10
			for k = 1:10
				for l = 1:10
					for m = 1:10
						for n = 1:10
							for o = 1:10
								for p = 1:10
									for q = 1:10
										for r = 1:10
											for s = 1:10
												for t = 1:10
													ans_now = Yield(Price, [i j k l m n o p q r s t]);
													if ans_now < ans
														ans = ans_now;
														ans_set = [i j k l m n o p q r s t];
													endif
												endfor
											endfor
										endfor
									endfor
								endfor
							endfor
						endfor
					endfor
				endfor
			endfor
		endfor
	endfor
end
