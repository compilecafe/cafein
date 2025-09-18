<script lang="ts">
	import { squircle } from '$lib/client/attachments';
	import { cn } from '$lib/client/cn';
	import Icon from './icon.svelte';
	import type { SvelteHTMLElements } from 'svelte/elements';

	let {
		message,
		...rest
	}: SvelteHTMLElements['div'] & {
		message: {
			type: 'error' | 'warning' | 'success' | 'info';
			title: string;
			description: string;
		};
	} = $props();

	let colours = {
		error: 'bg-error-600/10 border-error-200 text-error-600',
		warning: 'bg-warning-600/10 border-warning-200 text-warning-600',
		success: 'bg-success-600/10 border-success-200 text-success-600',
		info: 'bg-info-600/10 border-info-200 text-info-600'
	};
</script>

<div
	{@attach squircle()}
	{...rest}
	class={cn(
		'flex items-start gap-2 rounded-xl border px-4 py-4',
		colours[message.type],
		rest.class
	)}
>
	<Icon class="shrink-0 text-2xl" icon="solar:danger-triangle-bold-duotone" />
	<div class="flex flex-col gap-1">
		<span class="font-medium">{message.title}</span>
		<span class="text-sm">{message.description}</span>
	</div>
</div>
