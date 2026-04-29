//https://leetcode.com/problems/group-anagrams/description/
function groupAnagrams(strs: string[]): string[][] {
  const groups = new Map<string, string[]>();

  for (const str of strs) {
    const sortedStr = str.split("").sort().join();
    const group = groups.get(sortedStr) ?? [];
    group.push(str);

    groups.set(sortedStr, group);
  }

  return Array.from(groups.values());
}

const strs = ["eat", "tea", "tan", "ate", "nat", "bat"];
const res = groupAnagrams(strs);
const expected = [["tan", "nat"], ["bat"], ["eat", "tea", "ate"]];
console.log(strs, expected, res);
