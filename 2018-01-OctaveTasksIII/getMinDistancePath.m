function min_path = getMinDistancePath(distances)
    min_distance = 999999;
    min_path = zeros(1);
    combinations = perms(1:8);
    for i = 1:rows(combinations)
        temp_path = [combinations(i,:) combinations(i,1)];
        temp_distance = getTotalDistance(distances,temp_path);
        if temp_distance < min_distance
            min_distance = temp_distance;
            min_path = temp_path;
        endif
    endfor
end
