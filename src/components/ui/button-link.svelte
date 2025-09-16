<script lang="ts">
	import { squircle } from '$lib/client/attachments';
	import { cn } from '$lib/client/cn';
	import { buttonVariant } from './button.svelte';
	import { type VariantProps } from 'class-variance-authority';
	import type { HTMLAnchorAttributes } from 'svelte/elements';

	type ButtonProps = HTMLAnchorAttributes &
		VariantProps<typeof buttonVariant> & {
			radius?: number;
		};

	let { children, intent, radius, ...rest }: ButtonProps = $props();
</script>

<a class={cn(buttonVariant({ intent }), rest.class)} {@attach squircle(radius)} {...rest}>
	{@render children?.()}
</a>
