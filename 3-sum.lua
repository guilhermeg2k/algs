local pprint = require "pprint"
function three_sum(arr, target)
  table.sort(arr)
  local res = {}

  for i, v in pairs(arr) do
    if i > 1 and arr[i] == arr[i - 1] then
      goto continue
    end

    local l = i + 1
    local r = #arr

    while l < r do
      local sum = v + arr[l] + arr[r]

      if (sum == target) then
        table.insert(res, { v, arr[l], arr[r] })
        l = l + 1

        while arr[l - 1] == arr[l] and l < r do
          l = l + 1
        end

        goto continue
      end

      if (sum > target) then
        r = r - 1
        goto continue
      end

      l = l + 1
      ::continue::
    end
    ::continue::
  end

  return res
end

function test()
  local tests = {
    {
      arr = { -1, 0, 1, 2, -1, -4 },
      target = 0,
      expected = { { -1, -1, 2 }, { -1, 0, 1 } }
    },
    {
      arr = { 0, 0, 0 },
      target = 0,
      expected = { { 0, 0, 0 } }
    },
    {
      arr = { 3, 4, 5, 6, 7 },
      target = 12,
      expected = { { 3, 4, 5 } }
    },
  };

  for _, test in pairs(tests) do
    local res = three_sum(test.arr, test.target)

    for i, _ in pairs(test.expected) do
      for j, _ in pairs(test.expected[i]) do
        local res_v = res[i] ~= nil and res[i][j] or nil
        if(test.expected[i][j] ~= res_v) then
          print('Target', test.target)
          print('Expected:')
          pprint(test.expected[i]);
          print('Got:')
          pprint(res[i]);
        end
        assert(test.expected[i][j] == res_v)
      end
    end
  end

  print('All tests passed')
end

test()
