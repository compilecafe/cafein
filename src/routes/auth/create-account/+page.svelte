<script lang="ts">
	import Icon from '$components/ui/icon.svelte';
	import noiseBg from '$assets/noise.png';
	import { squircle } from '$lib/client/attachments';
	import LogoDarkWordmark from '$components/brand/logo-dark-wordmark.svelte';
	import Button from '$components/ui/button.svelte';
	import ButtonLink from '$components/ui/button-link.svelte';
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
			<h1 class="mt-4 mb-2 text-3xl">Welcome</h1>
			<p>Let’s get you set up — it’s quick.</p>
			<hr class="my-6 w-full border-t border-dashed border-gray-300" />
			<form action="" class="flex w-full flex-col gap-y-4">
				<div class="flex flex-col gap-2">
					<label for="username" class="font-medium">Pick a username</label>
					<div class="relative">
						<input
							type="text"
							id="username"
							name="username"
							class="peer h-14 w-full rounded-xl border border-gray-300 pr-4 pl-12 transition-all focus:border-primary-600 focus:outline-none"
							placeholder="e.g. cooldev123"
							{@attach squircle()}
						/>
						<Icon
							icon="solar:user-bold-duotone"
							class="absolute top-1/2 left-4 size-6 -translate-y-1/2 text-gray-400 transition-all peer-focus:text-primary-600"
						/>
					</div>
				</div>
				<div class="flex flex-col gap-2">
					<label for="password" class="font-medium">Create a password</label>
					<div class="relative">
						<input
							type="password"
							id="password"
							name="password"
							class="peer h-14 w-full rounded-xl border border-gray-300 pr-4 pl-12 transition-all focus:border-primary-600 focus:outline-none"
							placeholder="••••••••"
							{@attach squircle()}
						/>
						<Icon
							icon="solar:lock-password-bold-duotone"
							class="absolute top-1/2 left-4 size-6 -translate-y-1/2 text-gray-400 transition-all peer-focus:text-primary-600"
						/>
					</div>
				</div>
				<div class="flex flex-col gap-2">
					<label for="password" class="font-medium">Confirm your password</label>
					<div class="relative">
						<input
							type="password"
							id="password"
							name="password"
							class="peer h-14 w-full rounded-xl border border-gray-300 pr-4 pl-12 transition-all focus:border-primary-600 focus:outline-none"
							placeholder="••••••••"
							{@attach squircle()}
						/>
						<Icon
							icon="solar:lock-password-bold-duotone"
							class="absolute top-1/2 left-4 size-6 -translate-y-1/2 text-gray-400 transition-all peer-focus:text-primary-600"
						/>
					</div>
				</div>
				<Button>
					Create my account
					<Icon icon="solar:map-arrow-right-bold-duotone" />
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
		</div>
	</div>
</div>
