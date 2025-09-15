import * as v from 'valibot';

export const UsernameSchema = v.pipe(
	v.string(),
	v.regex(
		/^(?!.*\.\.)(?!.*\s)[a-zA-Z0-9._]{2,32}$/,
		'Username must be 2–32 characters, using letters, numbers, underscores, or dots, and cannot have consecutive dots or spaces'
	)
);

export const CreateAccountSchema = v.pipe(
	v.object({
		username: UsernameSchema,
		password: v.pipe(
			v.string(),
			v.minLength(8, 'Try making your password at least 8 characters'),
			v.maxLength(128, 'Keep your password under 128 characters'),
			v.regex(/[a-z]/, 'Add at least one lowercase letter'),
			v.regex(/[A-Z]/, 'Add at least one uppercase letter'),
			v.regex(/[0-9]/, 'Add at least one number')
		)
	})
);
