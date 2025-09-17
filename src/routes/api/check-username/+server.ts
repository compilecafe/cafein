import { checkUsername } from '$lib/server/repositories/users';
import type { RequestHandler } from './$types';
import { json } from '@sveltejs/kit';

export const POST: RequestHandler = async ({ request }) => {
	const { username } = await request.json();

	const isAvailable = await checkUsername(username);

	return json({ isAvailable: !isAvailable });
};
