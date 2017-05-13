function showCategories( I , C )

  imagesc(I);
  for i = 1:numel(C)
    c = C{i};
    i1 = I;
    for j = 1:numel(c)
      i1(c{j}) = 255;
    end
    imagesc(i1);
    pause;
  end
end
