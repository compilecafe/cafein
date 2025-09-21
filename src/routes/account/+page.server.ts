import { getActiveSessionsForUser } from '$lib/server/repositories/sessions';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ parent, locals }) => {
	await parent();

	const session = locals.session!;
	const sessions = await getActiveSessionsForUser(session.users.id);

	return { sessions, currentSession: session.sessions.token };
};
