<script lang="ts">
	import favicon from '$assets/favicon.png';
	import '../app.css';
	import '@fontsource-variable/mona-sans';
	import '@fontsource/coming-soon';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children?.()}
