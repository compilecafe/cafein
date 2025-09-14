<script lang="ts">
	import '../app.css';
	import '@fontsource-variable/mona-sans';
	import '@fontsource/coming-soon';
	import favicon from '$assets/favicon.png';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children?.()}
