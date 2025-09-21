<script module>
	export const buttonVariant = cva(
		[
			'inline-flex items-center whitespace-nowrap justify-center gap-2 rounded-xl font-medium transition-all '
		],
		{
			variants: {
				intent: {
					primary: ['bg-primary-600 text-pink-100'],
					light: ['bg-white text-pink-600'],
					ghost: ['border border-gray-300 text-gray-600'],
					'ghost-error': ['border border-error-300 text-error-600']
				},
				disabled: {
					false: null,
					true: ['opacity-50', 'cursor-not-allowed']
				},
				size: {
					sm: ['h-10 px-4 text-sm [&>svg]:size-4'],
					md: ['h-14 px-6 [&>svg]:size-6']
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
				},
				{
					intent: 'ghost-error',
					disabled: false,
					class: 'hover:bg-error-100'
				}
			],
			defaultVariants: {
				intent: 'primary',
				disabled: false,
				size: 'md'
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

	let { children, intent, size, disabled, radius, ...rest }: ButtonProps = $props();
</script>

<button
	class={cn(buttonVariant({ intent, disabled, size }), rest.class)}
	{disabled}
	{@attach squircle(radius)}
	{...rest}
>
	{@render children?.()}
</button>
