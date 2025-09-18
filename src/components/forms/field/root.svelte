<script lang="ts">
	import { cn } from '$lib/client/cn';
	import type { SvelteHTMLElements } from 'svelte/elements';

	let { children, ...props }: SvelteHTMLElements['div'] = $props();
</script>

<div {...props} class={cn('flex flex-col gap-2', props.class)}>
	{@render children?.()}
</div>
