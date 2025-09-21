import { getUserBySession } from '$lib/server/repositories/sessions';
import type { Handle } from '@sveltejs/kit';

export const handle: Handle = async ({ event, resolve }) => {
	const token = event.cookies.get('cfauth');
	if (token) {
		const user = await getUserBySession(token);
		if (user) event.locals.session = user;
	}
	const response = await resolve(event);
	return response;
};
