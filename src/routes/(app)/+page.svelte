<script lang="ts">
	import noiseBg from '$assets/noise.png';
	import ButtonLink from '$components/ui/button-link.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { squircle } from '$lib/client/attachments';
</script>

<main
	class="relative flex min-h-dvh items-center border-b-4 border-dashed border-primary-300 bg-primary-600 py-26"
	style="background-image: url({noiseBg});"
>
	<div class="inner">
		<div class="mx-auto flex max-w-4xl flex-col items-center gap-6">
			<a
				href="/about"
				class="inline-flex items-center gap-2 rounded-full border border-primary-700 bg-primary-700 py-1 pr-5 pl-1 text-sm text-primary-100"
			>
				<span class="rounded-full bg-white px-4 py-2 font-medium text-primary-600">New</span> Simple
				& Private
			</a>
			<h1 class="text-center text-7xl text-pink-100">
				Your fast, simple, no-drama identity solution
			</h1>
			<p class="max-w-xl text-center text-xl text-primary-200">
				Finally, an identity provider that doesn’t ask for your life story. Username, password,
				done.
			</p>
			<ButtonLink intent="light" href="/">
				Let’s Go!
				<Icon icon="solar:map-arrow-right-bold-duotone" />
			</ButtonLink>
			<div class="mt-10 grid grid-cols-3 divide-x divide-dashed divide-pink-300">
				<div class="flex gap-2 p-4">
					<Icon
						class="mt-0.5 size-8 shrink-0 text-pink-100"
						icon="solar:verified-check-bold-duotone"
					/>
					<div class="flex flex-col">
						<span class="text-lg text-pink-100">Pick a username</span>
						<span class="text-sm text-pink-200"> Enter the username you want to use. </span>
					</div>
				</div>
				<div class="flex gap-2 p-4">
					<Icon
						class="mt-0.5 size-8 shrink-0 text-pink-100"
						icon="solar:password-minimalistic-input-bold-duotone"
					/>
					<div class="flex flex-col">
						<span class="text-lg text-pink-100">Make a password</span>
						<span class="text-sm text-pink-200">Choose a password. That’s all we need.</span>
					</div>
				</div>
				<div class="flex gap-2 p-4">
					<Icon
						class="mt-0.5 size-8 shrink-0 text-pink-100"
						icon="solar:user-check-rounded-bold-duotone"
					/>
					<div class="flex flex-col">
						<span class="text-lg text-pink-100">Boom, you’re in</span>
						<span class="text-sm text-pink-200">
							Done. Use your username + password to log in any time.
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<section class="py-36">
	<div class="inner">
		<span
			class="inline-flex items-center gap-2 rounded-full border border-gray-300 bg-white px-4 py-2 font-medium text-gray-500 ring-4 ring-gray-200"
		>
			<Icon class="text-xl text-primary-600" icon="solar:rocket-bold-duotone" />
			Built for Trust
		</span>
		<div class="mt-8 mb-16 grid grid-cols-2 items-end gap-10">
			<h2 class="text-5xl">Simple Doesn’t Mean Unsafe</h2>
			<p class="text-right text-xl">
				Cafein keeps your login simple but takes security and recovery seriously.
			</p>
		</div>
		<div class="grid grid-cols-3 gap-4">
			<div class="relative overflow-hidden rounded-3xl bg-white p-8" {@attach squircle(24)}>
				<div class="flex flex-col gap-2">
					<div
						class="mb-2 grid size-16 place-items-center rounded-2xl bg-primary-100"
						{@attach squircle(16)}
					>
						<Icon class="text-4xl text-primary-600" icon="solar:heart-lock-bold-duotone" />
					</div>
					<h3 class="text-2xl">Security & Privacy</h3>
					<p>
						We protect your login with strong encryption and make sure your information always stays
						private.
					</p>
				</div>
			</div>
			<div class="relative overflow-hidden rounded-3xl bg-white p-8" {@attach squircle(24)}>
				<div class="flex flex-col gap-2">
					<div
						class="mb-2 grid size-16 place-items-center rounded-2xl bg-primary-100"
						{@attach squircle(16)}
					>
						<Icon class="text-4xl text-primary-600" icon="solar:key-minimalistic-2-bold-duotone" />
					</div>
					<h3 class="text-2xl">Flexible Recovery</h3>
					<p>
						Lost access? No worries, you can use backup codes, an authenticator, a recovery phrase,
						or a secure file.
					</p>
				</div>
			</div>
			<div class="relative overflow-hidden rounded-3xl bg-white p-8" {@attach squircle(24)}>
				<div class="flex flex-col gap-2">
					<div
						class="mb-2 grid size-16 place-items-center rounded-2xl bg-primary-100"
						{@attach squircle(16)}
					>
						<Icon class="text-4xl text-primary-600" icon="solar:wind-bold-duotone" />
					</div>
					<h3 class="text-2xl">Fast & Reliable</h3>
					<p>
						You can sign in instantly every time and recover your account smoothly whenever you
						need.
					</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="bg-white py-36">
	<div class="inner">
		<div class="grid grid-cols-2 gap-20">
			<div class="space-y-8">
				<span
					class="inline-flex items-center gap-2 rounded-full border border-gray-300 bg-white px-4 py-2 font-medium text-gray-500 ring-4 ring-gray-200"
				>
					<Icon class="text-xl text-primary-600" icon="solar:code-2-bold-duotone" />
					Quick Integration
				</span>
				<h2 class="text-5xl">Building an app? Cafein makes auth simple</h2>
				<p class="text-xl">
					Cafein follows standard OAuth 2.0 and OpenID Connect so you can integrate it the usual
					way. Just generate a client ID and secret and start authenticating.
				</p>
				<ButtonLink href="/" {@attach squircle()}>
					Go to Console
					<Icon icon="solar:map-arrow-right-bold-duotone" />
				</ButtonLink>
			</div>
			<div class="flex flex-col gap-6 py-12">
				<div
					class="relative -rotate-4 overflow-hidden rounded-3xl bg-primary-100 p-2"
					{@attach squircle(24)}
				>
					<div class="relative flex items-center gap-2">
						<div class="grid size-12 place-items-center rounded-xl bg-white" {@attach squircle(16)}>
							<Icon
								class="text-2xl text-primary-600"
								icon="solar:laptop-minimalistic-bold-duotone"
							/>
						</div>
						<h3 class="text-xl">Sign in to the Console</h3>
						<div
							class="ml-auto size-12 rounded-xl bg-white p-1 text-lg font-medium"
							{@attach squircle(16)}
						>
							<div class="grid size-full place-items-center rounded-xl bg-primary-100">01</div>
						</div>
					</div>
					<div
						class="absolute top-0 left-0 size-60 -translate-1/2 rounded-full bg-primary-600/10 blur-3xl"
					></div>
					<div
						class="absolute right-0 bottom-0 size-30 translate-1/2 rounded-full bg-primary-600/30 blur-3xl"
					></div>
				</div>
				<div
					class="relative rotate-4 overflow-hidden rounded-3xl bg-primary-100 p-2"
					{@attach squircle(24)}
				>
					<div class="relative flex items-center gap-2">
						<div class="grid size-12 place-items-center rounded-xl bg-white" {@attach squircle(16)}>
							<Icon class="text-2xl text-primary-600" icon="solar:star-shine-bold-duotone" />
						</div>
						<h3 class="text-xl">Create a new Client ID</h3>
						<div
							class="ml-auto size-12 rounded-xl bg-white p-1 text-lg font-medium"
							{@attach squircle(16)}
						>
							<div class="grid size-full place-items-center rounded-xl bg-primary-100">02</div>
						</div>
					</div>
					<div
						class="absolute top-0 left-0 size-60 -translate-1/2 rounded-full bg-primary-600/10 blur-3xl"
					></div>
					<div
						class="absolute right-0 bottom-0 size-30 translate-1/2 rounded-full bg-primary-600/30 blur-3xl"
					></div>
				</div>
				<div
					class="relative -rotate-4 overflow-hidden rounded-3xl bg-primary-100 p-2"
					{@attach squircle(24)}
				>
					<div class="relative flex items-center gap-2">
						<div class="grid size-12 place-items-center rounded-xl bg-white" {@attach squircle(16)}>
							<Icon class="text-2xl text-primary-600" icon="solar:settings-bold-duotone" />
						</div>
						<h3 class="text-xl">Configure your Redirect URI</h3>
						<div
							class="ml-auto size-12 rounded-xl bg-white p-1 text-lg font-medium"
							{@attach squircle(16)}
						>
							<div class="grid size-full place-items-center rounded-xl bg-primary-100">03</div>
						</div>
					</div>
					<div
						class="absolute top-0 left-0 size-60 -translate-1/2 rounded-full bg-primary-600/10 blur-3xl"
					></div>
					<div
						class="absolute right-0 bottom-0 size-30 translate-1/2 rounded-full bg-primary-600/30 blur-3xl"
					></div>
				</div>
				<div
					class="relative rotate-4 overflow-hidden rounded-3xl bg-primary-100 p-2"
					{@attach squircle(24)}
				>
					<div class="relative flex items-center gap-2">
						<div class="grid size-12 place-items-center rounded-xl bg-white" {@attach squircle(16)}>
							<Icon class="text-2xl text-primary-600" icon="solar:check-circle-bold-duotone" />
						</div>
						<h3 class="text-xl">Start authenticating</h3>
						<div
							class="ml-auto size-12 rounded-xl bg-white p-1 text-lg font-medium"
							{@attach squircle(16)}
						>
							<div class="grid size-full place-items-center rounded-xl bg-primary-100">04</div>
						</div>
					</div>
					<div
						class="absolute top-0 left-0 size-60 -translate-1/2 rounded-full bg-primary-600/10 blur-3xl"
					></div>
					<div
						class="absolute right-0 bottom-0 size-30 translate-1/2 rounded-full bg-primary-600/30 blur-3xl"
					></div>
				</div>
			</div>
		</div>
	</div>
</section>

<section
	class="border-t-4 border-dashed border-primary-300 bg-primary-600 py-12"
	style="background-image: url({noiseBg});"
>
	<div class="inner">
		<div class="flex flex-col items-center gap-6">
			<h2 class="text-2xl font-medium text-primary-100">Login the easy way, finally</h2>
			<ButtonLink intent="light" href="/">
				Create Your Account
				<Icon icon="solar:map-arrow-right-bold-duotone" />
			</ButtonLink>
		</div>
	</div>
</section>
