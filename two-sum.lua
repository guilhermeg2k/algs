function two_sum(arr, target)
  local p1 = 1
  local p2 = #arr

  for _=1, #arr do
    local sum = arr[p1] + arr[p2]

    if (sum == target) then 
      return {arr[p1], arr[p2]} 
    end

    if (sum > target) then
      p2 = p2-1
    else
      p1 = p1+1
    end
  end
end

function test()
  local arr = {1,10,30,32,33,54,55,90,100,110,140,1000}

  local tests = {
    {
      target = 110,
      expected = {10, 100}
    }, {
      target = 122,
      expected = {32, 90}
    }, {
      target = 109,
      expected = {54, 55}
    }
  };

  for _, v in pairs(tests) do
    local res = two_sum(arr, v.target)
    assert(res[1] == v.expected[1])
    assert(res[2] == v.expected[2])
  end

  print('All tests passed')
end

test()
