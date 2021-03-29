"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ranking = void 0;
const ranking = (arr) => arr.map((x, y, z) => z.filter((w) => w > x).length + 1);
exports.ranking = ranking;
