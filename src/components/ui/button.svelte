<script module>
	export const buttonVariant = cva(
		[
			'inline-flex h-14 items-center whitespace-nowrap justify-center gap-2 rounded-xl px-6 font-medium transition-all [&>svg]:size-6'
		],
		{
			variants: {
				intent: {
					primary: ['bg-primary-600 text-pink-100'],
					light: ['bg-white text-pink-600'],
					ghost: ['border border-gray-300 text-gray-600']
				},
				disabled: {
					false: null,
					true: ['opacity-50', 'cursor-not-allowed']
				}
			},
			compoundVariants: [
				{
					intent: 'primary',
					disabled: false,
					class: 'hover:bg-pink-700'
				},
				{
					intent: 'light',
					disabled: false,
					class: 'hover:bg-pink-100'
				},
				{
					intent: 'ghost',
					disabled: false,
					class: 'hover:bg-gray-200'
				}
			],
			defaultVariants: {
				intent: 'primary',
				disabled: false
			}
		}
	);
</script>

<script lang="ts">
	import { squircle } from '$lib/client/attachments';
	import { cn } from '$lib/client/cn';
	import { cva, type VariantProps } from 'class-variance-authority';
	import type { HTMLButtonAttributes } from 'svelte/elements';

	type ButtonProps = HTMLButtonAttributes &
		VariantProps<typeof buttonVariant> & {
			radius?: number;
		};

	let { children, intent, disabled, radius, ...rest }: ButtonProps = $props();
</script>

<button
	class={cn(buttonVariant({ intent, disabled }), rest.class)}
	{disabled}
	{@attach squircle(radius)}
	{...rest}
>
	{@render children?.()}
</button>
