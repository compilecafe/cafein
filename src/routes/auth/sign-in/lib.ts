import * as v from 'valibot';

export const SignInSchema = v.object({
	username: v.pipe(v.string(), v.nonEmpty('Please enter your username.')),
	password: v.pipe(v.string(), v.nonEmpty('Please enter your password.'))
});
