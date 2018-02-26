function y = Bell(Q,x,path_distances)
  y = Q * exp((-(mean(path_distances)-x).^2)/(2*var(path_distances))); % Write code here
end