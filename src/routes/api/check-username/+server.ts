import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import { checkUsername } from '$lib/server/repositories/users';

export const POST: RequestHandler = async ({ request }) => {
	const { username } = await request.json();

	const isAvailable = await checkUsername(username);

	return json({ isAvailable: !isAvailable });
};
