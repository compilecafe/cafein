<script lang="ts">
	import noiseBg from '$assets/noise.png';
	import LogoDarkWordmark from '$components/brand/logo-dark-wordmark.svelte';
	import { squircle } from '$lib/client/attachments';

	let { children } = $props();
</script>

<div
	class="relative flex min-h-dvh items-center bg-primary-600 py-10"
	style="background-image: url({noiseBg});"
>
	<div class="inner">
		<div
			class="mx-auto flex w-full max-w-md flex-col items-center rounded-3xl bg-gray-100 p-10"
			{@attach squircle(24)}
		>
			<a href="/" aria-label="Home"><LogoDarkWordmark height={40} /></a>
			{@render children?.()}
		</div>
	</div>
</div>
