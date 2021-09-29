export const getRankArrayOfNumbers = (arr: number[]) =>
  arr.map((x, y, z) => z.filter((w) => w > x).length + 1);
//
