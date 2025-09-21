<script lang="ts">
	import noiseBg from '$assets/noise.png';
	import LogoDarkWordmark from '$components/brand/logo-dark-wordmark.svelte';
	import Button from '$components/ui/button.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { squircle } from '$lib/client/attachments';
	import { ua } from '$lib/shared/utils/ua';

	let { data } = $props();

	const getSessionIcon = (type?: string) => {
		const sessionIcons = {
			mobile: 'solar:smartphone-bold-duotone',
			tablet: 'solar:tablet-bold-duotone',
			else: 'solar:laptop-bold-duotone'
		};

		return sessionIcons[type as keyof typeof sessionIcons] || sessionIcons.else;
	};
</script>

<header class="fixed inset-x-0 top-0 z-50 bg-white/40 backdrop-blur-xl">
	<div class="inner">
		<div class="flex items-center justify-between py-4">
			<a href="/">
				<LogoDarkWordmark height="40" />
			</a>
			<div class="flex rounded-full border-2 border-dashed border-primary-300 bg-primary-600 p-1">
				<a
					class="flex h-10 items-center rounded-full bg-white px-4 font-medium text-primary-600"
					href="/account"
				>
					Overview
				</a>
				<a
					class="flex h-10 items-center rounded-full px-4 font-medium text-primary-200 transition-all hover:bg-primary-700"
					href="/account/profile"
				>
					Profile
				</a>
				<a
					class="flex h-10 items-center rounded-full px-4 font-medium text-primary-200 transition-all hover:bg-primary-700"
					href="/account/security"
				>
					Secutiry
				</a>
				<a
					class="flex h-10 items-center rounded-full px-4 font-medium text-primary-200 transition-all hover:bg-primary-700"
					href="/account/developer"
				>
					Developer
				</a>
			</div>
		</div>
	</div>
</header>

<main class="min-h-dvh py-32">
	<div class="inner">
		<h1 class="mb-2 text-4xl">Welcome to your Cafein dashboard</h1>
		<p>This is your space to check sessions and keep your account safe.</p>
		<div class="mt-10 grid grid-cols-2 gap-10">
			<div
				class="rounded-2xl bg-primary-600 bg-gradient-to-br p-8"
				style="background-image: url({noiseBg});"
				{@attach squircle(16)}
			>
				<h2 class="mb-2 text-3xl text-primary-100">Keep your account safe</h2>
				<p class="text-primary-200">
					We recommend setting up a few extra things to protect your account.
				</p>
				<div class="mt-8 space-y-4">
					<div class="flex gap-4 rounded-xl bg-primary-600 p-4" {@attach squircle(12)}>
						<div
							class="grid size-12 shrink-0 place-items-center rounded-xl bg-white"
							{@attach squircle(16)}
						>
							<Icon class="text-2xl text-error-600" icon="solar:danger-triangle-bold-duotone" />
						</div>
						<div class="flex w-full flex-col">
							<h3 class="text-xl text-primary-100">Set up an authenticator app (TOTP)</h3>
							<p class="text-primary-200">Add an extra layer of security when you log in.</p>
							<a
								class="mt-4 flex items-center gap-2 font-medium text-primary-200 hover:text-white"
								href="/account/security?set=totp"
							>
								Set up TOTP <Icon class="text-2xl" icon="solar:arrow-right-bold-duotone" />
							</a>
						</div>
					</div>
					<div class="flex gap-4 rounded-xl bg-primary-600 p-4" {@attach squircle(12)}>
						<div
							class="grid size-12 shrink-0 place-items-center rounded-xl bg-white"
							{@attach squircle(16)}
						>
							<Icon class="text-2xl text-error-600" icon="solar:danger-triangle-bold-duotone" />
						</div>
						<div class="flex w-full flex-col">
							<h3 class="text-xl text-primary-100">Generate backup codes</h3>
							<p class="text-primary-200">
								Get one-time codes to access your account if you lose your device.
							</p>
							<a
								class="mt-4 flex items-center gap-2 font-medium text-primary-200 hover:text-white"
								href="/account/security?set=totp"
							>
								Generate backup codes
								<Icon class="text-2xl" icon="solar:arrow-right-bold-duotone" />
							</a>
						</div>
					</div>
					<div class="flex gap-4 rounded-xl bg-primary-600 p-4" {@attach squircle(12)}>
						<div
							class="grid size-12 shrink-0 place-items-center rounded-xl bg-white"
							{@attach squircle(16)}
						>
							<Icon class="text-2xl text-error-600" icon="solar:danger-triangle-bold-duotone" />
						</div>
						<div class="flex w-full flex-col">
							<h3 class="text-xl text-primary-100">Create a recovery phrase</h3>
							<p class="text-primary-200">
								Use this phrase to securely recover your account if you forget your password.
							</p>
							<a
								class="mt-4 flex items-center gap-2 font-medium text-primary-200 hover:text-white"
								href="/account/security?set=totp"
							>
								Set up recovery phrase
								<Icon class="text-2xl" icon="solar:arrow-right-bold-duotone" />
							</a>
						</div>
					</div>
					<div class="flex gap-4 rounded-xl bg-primary-600 p-4" {@attach squircle(12)}>
						<div
							class="grid size-12 shrink-0 place-items-center rounded-xl bg-white"
							{@attach squircle(16)}
						>
							<Icon class="text-2xl text-error-600" icon="solar:danger-triangle-bold-duotone" />
						</div>
						<div class="flex w-full flex-col">
							<h3 class="text-xl text-primary-100">Download a recovery file</h3>
							<p class="text-primary-200">
								Keep a secure file you can use to restore your account anytime.
							</p>
							<a
								class="mt-4 flex items-center gap-2 font-medium text-primary-200 hover:text-white"
								href="/account/security?set=totp"
							>
								Download the recovery file
								<Icon class="text-2xl" icon="solar:arrow-right-bold-duotone" />
							</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<h2 class="mb-2 text-3xl">Where you’re signed in</h2>
				<p>See where and when your account’s been used.</p>
				<div class="mt-8 space-y-4">
					{#each data.sessions as session}
						<div class="flex gap-4" {@attach squircle(12)}>
							<div
								class="grid size-12 shrink-0 place-items-center rounded-xl bg-white"
								title={ua(session.userAgent).device.type}
								{@attach squircle(16)}
							>
								<Icon
									class="text-2xl text-gray-600"
									icon={getSessionIcon(ua(session.userAgent).device.type)}
								/>
							</div>
							<div class="w-full">
								<span class="flex items-center gap-2 text-sm font-medium text-gray-600">
									Sign in at {session.createdAt.toLocaleString()}
									{#if session.token === data.currentSession}
										<span
											class="inline-block rounded-full bg-success-600 px-2 py-0.5 text-xs font-medium text-success-100"
										>
											Current
										</span>
									{/if}
								</span>
								<h3 class="flex items-center gap-1 text-xl">
									{ua(session.userAgent).browser} on
									{ua(session.userAgent).os}
								</h3>
							</div>
							{#if !session.revoked && session.expiresAt > new Date()}
								<Button intent="ghost-error" size="sm">Revoke</Button>
							{:else if session.revoked}
								<span class="flex items-center gap-1 px-4 text-sm text-gray-600">Revoked</span>
							{:else}
								<span class="flex items-center gap-1 px-4 text-sm text-gray-600">Expired</span>
							{/if}
						</div>
						<hr class="block border-t border-dashed border-gray-400" />
					{/each}
					<Button>View all sessions</Button>
				</div>
			</div>
		</div>
	</div>
</main>
