import { fail } from '@sveltejs/kit';
import { superValidate } from 'sveltekit-superforms';
import { valibot } from 'sveltekit-superforms/adapters';
import { message } from 'sveltekit-superforms';
import { CreateAccountSchema } from './shared';

export const load = async () => {
	const form = await superValidate(valibot(CreateAccountSchema));

	return { form };
};

export const actions = {
	default: async ({ request }) => {
		const form = await superValidate(request, valibot(CreateAccountSchema));
		console.log(form);

		if (!form.valid) {
			return fail(400, { form });
		}

		return message(form, 'Form posted successfully!');
	}
};
