<script lang="ts">
	import { Field } from '$components/forms/field';
	import Alert from '$components/ui/alert.svelte';
	import ButtonLink from '$components/ui/button-link.svelte';
	import Button from '$components/ui/button.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { cn } from '$lib/client/cn';
	import { CreateAccountSchema, UsernameSchema } from './lib';
	import { useDebounce } from 'runed';
	import { superForm } from 'sveltekit-superforms';
	import { valibotClient } from 'sveltekit-superforms/adapters';
	import * as v from 'valibot';

	let { data } = $props();

	let usernameState: 'UNTOUCHED' | 'CHECKING' | 'INVALID' | 'AVAILABLE' | 'UNAVAILABLE' =
		$state('UNTOUCHED');

	let passwordRequirements = $derived([
		{
			key: 'length',
			valid: false,
			text: 'Try making your password at least 8 characters',
			validate: (pw: string) => pw.length >= 8
		},
		{
			key: 'lowercase',
			valid: false,
			text: 'Add at least one lowercase letter',
			validate: (pw: string) => /[a-z]/.test(pw)
		},
		{
			key: 'uppercase',
			valid: false,
			text: 'Add at least one uppercase letter',
			validate: (pw: string) => /[A-Z]/.test(pw)
		},
		{
			key: 'number',
			valid: false,
			text: 'Add at least one number',
			validate: (pw: string) => /[0-9]/.test(pw)
		}
	]);

	let buttonActive = $derived.by(() => {
		return passwordRequirements.every((req) => req.valid) && usernameState === 'AVAILABLE';
	});

	const { form, message, enhance, submitting } = superForm(data.form, {
		validators: valibotClient(CreateAccountSchema),
		validationMethod: 'onsubmit'
	});

	const debouncedCheck = useDebounce(
		async (username: string) => {
			const response = await fetch('/api/check-username', {
				method: 'POST',
				body: JSON.stringify({ username })
			});
			return (await response.json()).isAvailable;
		},
		() => 300
	);

	const handleChangeUsername = async (e: Event) => {
		const value = (e.target as HTMLInputElement).value;

		if (!v.safeParse(UsernameSchema, value).success) {
			usernameState = 'INVALID';
			return;
		}

		usernameState = 'CHECKING';
		usernameState = (await debouncedCheck(value)) ? 'AVAILABLE' : 'UNAVAILABLE';
	};

	const handleChangePassword = (e: Event) => {
		const input = e.target as HTMLInputElement;
		const password = input.value;

		passwordRequirements = passwordRequirements.map((req) => ({
			...req,
			valid: req.validate(password)
		}));
	};
</script>

<h1 class="mt-4 mb-2 text-3xl">Welcome</h1>
<p>Let’s get you set up — it’s quick.</p>
<hr class="my-6 w-full border-t border-dashed border-gray-300" />
{#if $message}
	<Alert message={$message} class="mb-4" />
{/if}
<form class="flex w-full flex-col gap-y-4" method="POST" use:enhance>
	<Field.Root>
		<Field.Label for="username">Pick a username</Field.Label>
		<Field.Input
			icon="solar:user-bold-duotone"
			id="username"
			name="username"
			placeholder="e.g. cooldev123"
			bind:value={$form.username}
			oninput={handleChangeUsername}
		/>
	</Field.Root>
	<div class="flex flex-col gap-2">
		{#if usernameState === 'CHECKING'}
			<div class="flex items-center gap-1">
				<Icon icon="solar:black-hole-3-bold-duotone" class="animate-spin text-2xl text-info-600" />
				<span class="text-sm font-medium text-info-600"> Checking username availability... </span>
			</div>
		{:else if usernameState === 'UNAVAILABLE'}
			<div class="flex items-center gap-1">
				<Icon icon="solar:heart-broken-bold-duotone" class="text-2xl text-error-600" />
				<span class="text-sm font-medium text-error-600">Username is not available</span>
			</div>
		{:else if usernameState === 'AVAILABLE'}
			<div class="flex items-center gap-1">
				<Icon icon="solar:confetti-bold-duotone" class="text-2xl text-success-600" />
				<span class="text-sm font-medium text-success-600">Username is available</span>
			</div>
		{/if}
		<p class={cn('text-sm text-gray-600', usernameState === 'INVALID' && 'text-error-600')}>
			Username must be 2–32 chars, can include letters, numbers, underscore or full stops, no spaces
			or repeating dots.
		</p>
	</div>
	<div class="flex flex-col gap-2">
		<Field.Root>
			<Field.Label for="password">Create a password</Field.Label>
			<Field.Input
				icon="solar:lock-password-bold-duotone"
				id="password"
				name="password"
				placeholder="••••••••"
				type="password"
				bind:value={$form.password}
				oninput={handleChangePassword}
			/>
		</Field.Root>
		<div class="space-y-1">
			{#each passwordRequirements as requirement}
				<div class="flex items-center gap-1">
					{#if requirement.valid}
						<Icon class="text-2xl text-success-600" icon="solar:confetti-bold-duotone" />
					{:else}
						<Icon class="text-2xl text-error-500" icon="solar:close-square-bold-duotone" />
					{/if}
					<span class="text-sm text-gray-600">
						{requirement.text}
					</span>
				</div>
			{/each}
		</div>
	</div>
	<Button disabled={!buttonActive || $submitting}>
		Create my account
		{#if $submitting}
			<Icon class="animate-spin" icon="solar:black-hole-3-bold-duotone" />
		{:else}
			<Icon icon="solar:map-arrow-right-bold-duotone" />
		{/if}
	</Button>
	<div class="flex items-center gap-2 text-sm font-medium whitespace-nowrap text-gray-500">
		<hr class="my-6 w-full border-t border-dashed border-gray-300" />
		Already have an account?
		<hr class="my-6 w-full border-t border-dashed border-gray-300" />
	</div>
	<ButtonLink intent="ghost" href="/auth/sign-in">
		Sign in
		<Icon icon="solar:star-rainbow-bold-duotone" />
	</ButtonLink>
</form>
