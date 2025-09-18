import { NODE_ENV } from '$env/static/private';
import { createSession } from '$lib/server/repositories/sessions';
import { getUserByUsername } from '$lib/server/repositories/users';
import { generateRandomString } from '$lib/server/utils/common';
import { SignInSchema } from './lib.js';
import { redirect } from '@sveltejs/kit';
import { superValidate } from 'sveltekit-superforms';
import { message } from 'sveltekit-superforms';
import { valibot } from 'sveltekit-superforms/adapters';

export const load = async () => {
	const form = await superValidate(valibot(SignInSchema));

	return { form };
};

export const actions = {
	default: async ({ request, cookies }) => {
		const form = await superValidate(request, valibot(SignInSchema));

		if (!form.valid) {
			return message(form, {
				type: 'error',
				title: 'Oops, something’s missing',
				description: 'Make sure your username and passwords look right before continuing'
			});
		}

		try {
			const user = await getUserByUsername(form.data.username);

			if (!user) {
				return message(
					form,
					{
						type: 'info',
						title: 'Oops, something’s missing',
						description: 'Make sure your username and passwords look right before continuing'
					},
					{
						status: 403
					}
				);
			}

			const token = generateRandomString();
			const expiresAt = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000);

			const userAgent = request.headers.get('user-agent') || 'unknown';
			const xff = request.headers.get('x-forwarded-for');
			const ipAddress = xff ? xff.split(',')[0]?.trim() : 'unknown';

			await createSession({
				token,
				expiresAt,
				userId: user.id,
				userAgent,
				ipAddress
			});

			cookies.set('cfauth', token, {
				path: '/',
				httpOnly: true,
				secure: NODE_ENV === 'production',
				sameSite: 'strict',
				maxAge: 30 * 24 * 60 * 60
			});
		} catch (error) {
			console.log('[SIGN_IN_ERROR]', error);
			return message(form, {
				type: 'error',
				title: 'Oops, something went wrong',
				description: 'We had a hiccup on our side. Try again in a moment.'
			});
		}

		return redirect(302, '/account');
	}
};
