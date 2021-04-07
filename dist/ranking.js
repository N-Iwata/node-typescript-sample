"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getRankArrayOfNumbers = void 0;
const getRankArrayOfNumbers = (arr) => arr.map((x, y, z) => z.filter((w) => w > x).length + 1);
exports.getRankArrayOfNumbers = getRankArrayOfNumbers;
