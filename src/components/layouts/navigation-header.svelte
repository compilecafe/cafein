<script lang="ts">
	import LogoLightWordmark from '../brand/logo-light-wordmark.svelte';
	import Icon from '$components/ui/icon.svelte';
	import { onMount } from 'svelte';
	import { cn } from '$lib/client/cn';

	let scrolled = $state(false);

	onMount(() => {
		const handleScroll = () => {
			if (window.scrollY > 64) {
				scrolled = true;
			} else {
				scrolled = false;
			}
		};

		window.addEventListener('scroll', handleScroll);
		return () => window.removeEventListener('scroll', handleScroll);
	});
</script>

<header
	class={cn(
		'absolute top-0 right-0 left-0 z-50  border-b border-dashed border-primary-300 py-6',
		scrolled &&
			'animate-down fixed right-auto left-1/2 max-w-max -translate-x-1/2 translate-y-4 rounded-full border border-primary-300 bg-primary-600 px-3 py-2 shadow-2xl shadow-black/30'
	)}
>
	<div class="{!scrolled && 'inner'} flex items-center justify-between gap-8">
		<a href="/" class="flex items-center gap-1 text-xl font-semibold text-primary-500">
			<LogoLightWordmark height={32} />
		</a>
		<nav
			class={cn(
				'flex items-center gap-8',
				scrolled && 'border-x border-dashed border-primary-300 px-8'
			)}
		>
			<a href="/" class="whitespace-nowrap text-primary-200 hover:text-white">Home</a>
			<a href="/" class="whitespace-nowrap text-primary-200 hover:text-white">About</a>
			<a href="/" class="whitespace-nowrap text-primary-200 hover:text-white">Docs</a>
		</nav>
		<nav class="flex items-center gap-4">
			<a
				class="leading-0 text-primary-200 transition-all hover:text-white"
				href="https://github.com/compilecafe/cafein"
			>
				<Icon class="text-2xl" icon="line-md:discord-twotone"></Icon>
			</a>
			<a
				class="inline-flex items-center gap-1 whitespace-nowrap text-primary-200 transition-all hover:text-white"
				href="https://github.com/compilecafe/cafein"
			>
				<Icon class="text-2xl" icon="line-md:github-twotone"></Icon>
			</a>
			<a
				href={'/auth/sign-in'}
				class="inline-flex h-10 items-center rounded-full bg-white px-4 text-sm font-medium whitespace-nowrap text-primary-600 transition-all hover:bg-primary-100"
			>
				Sign In
			</a>
		</nav>
	</div>
</header>
