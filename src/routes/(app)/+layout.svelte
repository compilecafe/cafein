<script lang="ts">
	import NavigationHeader from '$components/layouts/navigation-header.svelte';
	import Footer from '$components/layouts/footer.svelte';

	let { children } = $props();
</script>

<NavigationHeader />
{@render children?.()}
<Footer />
