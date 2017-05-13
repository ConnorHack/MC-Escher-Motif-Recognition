function s = compshape( A , B )

  B = imresize( B , size( A ) );

  prop_diff = mean(mean(abs(A-B)));

  [y x] = size(A);

  al = zeros(1,y);
  ar = zeros(1,y);
  at = zeros(1,x);
  ab = zeros(1,x);

  bl = zeros(1,y);
  br = zeros(1,y);
  bt = zeros(1,x);
  bb = zeros(1,x);

  for i = 1:y
    for j = 1:x
      if A(i,j) al(i) = j; end
      if B(i,j) bl(i) = j; end
    end

    for j = x:-1:1
      if A(i,j) ar(i) = j; end
      if B(i,j) br(i) = j; end
    end
  end

  for j = 1:x
    for i = 1:y
      if A(i,j) at(j) = i; end
      if B(i,j) bt(j) = i; end
    end

    for i = y:-1:1
      if A(i,j) ab(j) = i; end
      if B(i,j) bb(j) = i; end
    end
  end

  s = mean((al+ar+at+ab) - (bl+br+bt+bb));

  s = 1 - prop_diff;

end
