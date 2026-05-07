/** @type {import('@commitlint/types').UserConfig} */
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', [
      'feat', 'fix', 'hotfix', 'chore', 'refactor', 'test', 'docs', 'style', 'perf',
    ]],
    'header-max-length': [2, 'always', 50],
    'subject-full-stop': [2, 'never', '.'],
    'subject-case': [0],
    'scope-empty': [2, 'never'],
    'body-max-line-length': [2, 'always', 72],
  },
};
