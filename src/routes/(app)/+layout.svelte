<script lang="ts">
	import Footer from '$components/layouts/footer.svelte';
	import NavigationHeader from '$components/layouts/navigation-header.svelte';

	let { children } = $props();
</script>

<NavigationHeader />
{@render children?.()}
<Footer />
