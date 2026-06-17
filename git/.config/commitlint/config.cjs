/** @type {import('@commitlint/types').UserConfig} */
module.exports = {
  rules: {
    "type-enum": [
      2,
      "always",
      [
        "feat",
        "fix",
        "hotfix",
        "chore",
        "refactor",
        "test",
        "docs",
        "style",
        "perf",
      ],
    ],
    "type-empty": [2, "never"],
    "type-case": [2, "always", "lower-case"],
    "scope-empty": [2, "never"],
    "subject-empty": [2, "never"],
    "header-max-length": [2, "always", 50],
    "subject-full-stop": [2, "never", "."],
    "subject-case": [0],
    "body-max-line-length": [2, "always", 100],
  },
};
