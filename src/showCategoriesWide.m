function showCategories( I , C , divs)

  imagescWide(I,divs);
  pause;
  for i = 1:numel(C)
    c = C{i};
    i1 = I;
    for j = 1:numel(c)
      i1(c{j}) = 0;
    end
    imagescWide(i1,divs);
    pause;
  end
end
