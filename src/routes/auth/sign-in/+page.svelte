<script lang="ts">
	import noiseBg from '$assets/noise.png';
	import LogoDarkWordmark from '$components/brand/logo-dark-wordmark.svelte';
	import ButtonLink from '$components/ui/button-link.svelte';
	import Button from '$components/ui/button.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { squircle } from '$lib/client/attachments';
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
			<form action="" class="flex w-full flex-col gap-y-4">
				<div class="flex flex-col gap-2">
					<label for="username" class="font-medium">What's your username?</label>
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
					<label for="password" class="font-medium">And your password?</label>
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
					<a
						href="/auth/forgot-password"
						class="text-right text-sm font-medium text-gray-500 hover:text-primary-600"
					>
						Forgot it?
					</a>
				</div>
				<Button>
					Let me in
					<Icon icon="solar:map-arrow-right-bold-duotone" />
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
