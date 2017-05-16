function C = joinCellArray(A,B)

  C = A;
  for i = 1:numel(B)
    C{end+1} = B{i};
  end

end
