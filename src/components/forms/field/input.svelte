<script lang="ts">
	import Icon from '$components/ui/icon.svelte';
	import { showPassword, squircle } from '$lib/client/attachments';
	import { cn } from '$lib/client/cn';
	import type { HTMLInputAttributes } from 'svelte/elements';

	let {
		children,
		radius = 12,
		icon,
		type,
		value = $bindable(),
		...props
	}: HTMLInputAttributes & { radius?: number; icon: string } = $props();
</script>

<div class="relative">
	<input
		{type}
		bind:value
		class={cn(
			'peer h-14 w-full rounded-xl border border-gray-300 pr-4 pl-12 transition-all focus:border-primary-600 focus:outline-none',
			type === 'password' && 'pr-12',
			props.class
		)}
		{@attach squircle(radius)}
		{...props}
	/>
	{#if type === 'password'}
		<button
			type="button"
			class="group absolute top-1/2 right-4 -translate-y-1/2"
			{@attach showPassword}
		>
			<Icon icon="solar:eye-bold-duotone" class="size-6 text-gray-400 data-[state=shown]:hidden" />
			<Icon
				icon="solar:eye-closed-bold-duotone"
				class="hidden size-6 text-gray-400 data-[state=shown]:block"
			/>
		</button>
	{/if}
	<Icon
		{icon}
		class="absolute top-1/2 left-4 size-6 -translate-y-1/2 text-gray-400 transition-all peer-focus:text-primary-600"
	/>
</div>
