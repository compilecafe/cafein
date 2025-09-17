// See https://svelte.dev/docs/kit/types#app.d.ts

import type { SelectUser } from '$lib/server/db/schema';

// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			user?: SelectUser;
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
