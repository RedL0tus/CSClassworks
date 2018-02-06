function ans = getDistances(city)
	#city = zeros(8,2);
	#city(1,:) = [ 20 30 ];
	#city(2,:) = [ 20 70 ];
	#city(3,:) = [ 50 40 ];
	#city(4,:) = [ 50 10 ];
	#city(5,:) = [ 80 80 ];
	#city(6,:) = [ 90 60 ];
	#city(7,:) = [ 60 60 ];
	#city(8,:) = [ 40 90 ];
	distances = zeros(rows(city),rows(city));
	for i = 1:rows(city)
		for j = 1:rows(city)
			distance(i,j) = sqrt((city(i,1) - city(j,1))^2 + (city(i,2) - city(j,2))^2);
		endfor
	endfor
	ans = distance;
end
