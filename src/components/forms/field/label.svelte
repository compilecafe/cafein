<script lang="ts">
	import { cn } from '$lib/client/cn';
	import type { HTMLLabelAttributes } from 'svelte/elements';

	let { children, ...props }: HTMLLabelAttributes = $props();
</script>

<label {...props} class={cn('font-medium', props.class)}>{@render children?.()}</label>
