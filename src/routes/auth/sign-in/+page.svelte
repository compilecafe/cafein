<script lang="ts">
	import noiseBg from '$assets/noise.png';
	import LogoDarkWordmark from '$components/brand/logo-dark-wordmark.svelte';
	import { Field } from '$components/forms/field/index.js';
	import Alert from '$components/ui/alert.svelte';
	import ButtonLink from '$components/ui/button-link.svelte';
	import Button from '$components/ui/button.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { squircle } from '$lib/client/attachments';
	import { SignInSchema } from './lib.js';
	import { superForm } from 'sveltekit-superforms';
	import { valibotClient } from 'sveltekit-superforms/adapters';

	let { data } = $props();

	const { form, message, enhance, submitting, errors } = superForm(data.form, {
		validators: valibotClient(SignInSchema)
	});
</script>

<div
	class="relative flex min-h-dvh items-center bg-primary-600 py-26"
	style="background-image: url({noiseBg});"
>
	<div class="inner">
		<div
			class="mx-auto flex w-full max-w-md flex-col items-center rounded-3xl bg-gray-100 p-10"
			{@attach squircle(24)}
		>
			<a href="/" aria-label="Home"><LogoDarkWordmark height={40} /></a>
			<h1 class="mt-4 mb-2 text-3xl">Hi there</h1>
			<p>Alright, time to hop back in — log in below.</p>
			<hr class="my-6 w-full border-t border-dashed border-gray-300" />
			{#if $message}
				<Alert message={$message} class="mb-4" />
			{/if}
			<form method="POST" class="flex w-full flex-col gap-y-4" use:enhance>
				<Field.Root>
					<Field.Label for="username">What's your username?</Field.Label>
					<Field.Input
						icon="solar:user-bold-duotone"
						id="username"
						name="username"
						placeholder="e.g. cooldev123"
						bind:value={$form.username}
					/>
					{#if $errors.username}
						<span class="text-sm text-error-600">{$errors.username}</span>
					{/if}
				</Field.Root>
				<Field.Root>
					<Field.Label for="password">And your password?</Field.Label>
					<Field.Input
						icon="solar:lock-password-bold-duotone"
						type="password"
						id="password"
						name="password"
						placeholder="••••••••"
						bind:value={$form.password}
					/>
					{#if $errors.password}
						<span class="text-sm text-error-600">{$errors.password}</span>
					{/if}
					<a
						href="/auth/forgot-password"
						class="text-right text-sm font-medium text-gray-500 hover:text-primary-600"
					>
						Forgot it?
					</a>
				</Field.Root>
				<Button disabled={$submitting}>
					Let me in
					{#if $submitting}
						<Icon class="animate-spin" icon="solar:black-hole-3-bold-duotone" />
					{:else}
						<Icon icon="solar:map-arrow-right-bold-duotone" />
					{/if}
				</Button>
				<div class="flex items-center gap-2 text-sm font-medium whitespace-nowrap text-gray-500">
					<hr class="my-6 w-full border-t border-dashed border-gray-300" />
					New Here?
					<hr class="my-6 w-full border-t border-dashed border-gray-300" />
				</div>
				<ButtonLink intent="ghost" href="/auth/create-account">
					Create an account
					<Icon icon="solar:star-rainbow-bold-duotone" />
				</ButtonLink>
			</form>
		</div>
	</div>
</div>
