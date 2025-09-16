import * as v from 'valibot';

export const UsernameSchema = v.pipe(
	v.string(),
	v.regex(/^(?!.*\.\.)(?!.*\s)[a-zA-Z0-9._]{2,32}$/)
);

export const CreateAccountSchema = v.pipe(
	v.object({
		username: UsernameSchema,
		password: v.pipe(
			v.string(),
			v.minLength(8),
			v.maxLength(128),
			v.regex(/[a-z]/),
			v.regex(/[A-Z]/),
			v.regex(/[0-9]/)
		)
	})
);
