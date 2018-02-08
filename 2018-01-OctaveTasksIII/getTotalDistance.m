function total_distance = getTotalDistance(distances, path)
    total_distance = 0;
    for i = 1:8
        total_distance = total_distance + distances(path(i),path(i+1));
    endfor
end
