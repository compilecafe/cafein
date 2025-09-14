import { z as originalZ } from 'zod';

const customZodError: originalZ.core.$ZodErrorMap<originalZ.core.$ZodIssue> = (iss) => {
	const field = iss.path?.join('.') || 'this field';

	switch (iss.code) {
		case 'invalid_type':
			return `Oops! ${field} should be a ${iss.expected}.`;
		case 'invalid_format':
			return `Hmm, ${field} doesn’t look right. Give it another look!`;
		case 'not_multiple_of':
			return `Try a round number for ${field}.`;
		case 'unrecognized_keys':
			return `Extra stuff detected! Remove unexpected fields to keep it tidy.`;
		case 'invalid_union':
			return `Hmm, ${field} doesn’t match any allowed options.`;
		case 'invalid_key':
			return `Heads up! One of the keys isn’t recognized.`;
		case 'invalid_element':
			return `Something’s off in ${field}. Check the items carefully!`;
		case 'invalid_value':
			return `Let’s tweak ${field} to one of the allowed values.`;
		case 'custom':
			return `A little tweak needed for ${field}.`;
		default:
			return 'Let’s fix this field!';
	}
};

originalZ.config({ customError: customZodError });

export const z = originalZ;
