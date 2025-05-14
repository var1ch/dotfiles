module.exports = {
	root: true,
	env: {
		browser: true,
		node: true,
		es2025: true,
	},
	extends: [
		'airbnb-base',
		'prettier',
	],
	parserOptions: {
		ecmaVersion: 2025,
		sourceType: 'module',
	},
	plugins: ['prettier', 'import', 'jsdoc'],
	settings: {
		'import/resolver': {
			node: {
				extensions: ['.js', '.mjs'],
			},
		},
	},
	rules: {
		// Semicolons and 2-space indentation (Airbnb style)
		'prettier/prettier': ['error', {
			semi: true,
			singleQuote: true,
			tabWidth: 2,
			trailingComma: 'es5',
		}],

		// JSDoc validation for non-TypeScript code
		'jsdoc/require-jsdoc': ['warn', {
			publicOnly: true,
			require: {
				FunctionDeclaration: true,
				ClassDeclaration: true,
			},
		}],
		'jsdoc/require-param': 'warn',
		'jsdoc/require-param-type': 'warn',
		'jsdoc/require-returns': 'warn',
		'jsdoc/require-returns-type': 'warn',

		// Allow one-liners when appropriate
		'implicit-arrow-linebreak': 'off',
		'function-paren-newline': 'off',

		// Import sorting and organization
		'import/order': ['error', {
			groups: [
				'builtin',
				'external',
				'internal',
				['parent', 'sibling'],
				'index',
			],
			'newlines-between': 'always',
			alphabetize: {
				order: 'asc',
				caseInsensitive: true,
			},
		}],

		// Error handling
		'no-unused-vars': ['error', {
			argsIgnorePattern: '^_',
			varsIgnorePattern: '^_'
		}],

		// Security best practices
		'no-eval': 'error',
		'no-implied-eval': 'error',
	},
	// Overrides for different file types
	overrides: [
		// TypeScript files
		{
			files: ['*.ts'],
			parser: '@typescript-eslint/parser',
			extends: [
				'plugin:@typescript-eslint/recommended',
			],
			plugins: ['@typescript-eslint'],
			rules: {
				// Disable JSDoc requirements for TypeScript files
				'jsdoc/require-jsdoc': 'off',
				'jsdoc/require-param': 'off',
				'jsdoc/require-param-type': 'off',
				'jsdoc/require-returns': 'off',
				'jsdoc/require-returns-type': 'off',

				// TypeScript-specific rules
				'@typescript-eslint/explicit-function-return-type': 'off',
				'@typescript-eslint/explicit-module-boundary-types': 'off',
				'@typescript-eslint/no-explicit-any': 'warn',
			},
		},
		// Test files
		{
			files: [
				'**/*.test.js',
				'**/*.test.ts',
				'**/*.spec.js',
				'**/*.spec.ts',
			],
			env: {
				jest: true,
			},
			rules: {
				'import/no-extraneous-dependencies': 'off',
			},
		},
	],
};