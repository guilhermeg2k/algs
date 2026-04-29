const RomanValue = {
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000,
} as const;

type Roman = keyof typeof RomanValue;

function romanToInt(s: string): number {
  const romans = [...s] as Roman[];
  const subtractableBy: { [K in Roman]?: Roman[] } = {
    I: ["V", "X"],
    X: ["L", "C"],
    C: ["D", "M"],
  };

  let res = 0;

  for (let i = 0; i <= romans.length - 1; i++) {
    const roman = romans[i];
    const roman_value = RomanValue[roman];

    const next_roman = romans[i + 1];
    const subtractable = subtractableBy[roman];
    const shouldSubtract = subtractable?.includes(next_roman);

    if (shouldSubtract) {
      const next_roman_value = RomanValue[next_roman];
      res += next_roman_value - roman_value;
      i++;
      continue;
    }

    res += roman_value;
  }

  return res;
}

console.log(romanToInt("III"));
console.log(romanToInt("LVIII"));
console.log(romanToInt("MCMXCIV"));
