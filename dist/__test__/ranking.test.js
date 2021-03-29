"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const ranking_1 = require("../ranking");
describe("", () => {
    test("", () => {
        expect(ranking_1.ranking([1, 2, 5, 5])).toEqual([4, 3, 1, 1]);
    });
});
