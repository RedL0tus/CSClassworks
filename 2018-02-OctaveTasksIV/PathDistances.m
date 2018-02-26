function path_distances = PathDistances(matrix,paths)
  path_distances = zeros(1,40320); % This creates an empty 1X40320 matrix of path distances
  for i = 1:40320
    path_distances(1,i) = PathDistance(matrix,paths(i,:)); % Your only line of code (for Part I) should go here
  end
  % hist(path_distances) % Your only line of code (for Part II) should go here
end

function path_distance = PathDistance(matrix,path)
  path_distance = 0;
  for i = 1:8
    path_distance = path_distance+matrix(path(i),path(round(mod(i+1,8.5))));
  end
end