// See https://svelte.dev/docs/kit/types#app.d.ts
import type { SelectSession, SelectUser } from '$lib/server/db/schema';

// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			session?: { users: SelectUser; sessions: SelectSession };
		}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
		namespace Superforms {
			type Message = {
				type: 'error' | 'warning' | 'success' | 'info';
				title: string;
				description: string;
			};
		}
	}
}

export {};
