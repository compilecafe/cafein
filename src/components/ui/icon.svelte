<script lang="ts">
	import Icon from '@iconify/svelte';
	import { icons as solarIcons } from '@iconify-json/solar';
	import { icons as lineMdIcons } from '@iconify-json/line-md';

	let { icon, ...rest } = $props();

	const type = (icon as string).split(':')[0];
	const name = (icon as string).split(':')[1];

	const icons = type === 'solar' ? solarIcons : lineMdIcons;
</script>

<Icon icon={{ ...icons.icons[name], width: 24, height: 24 }} {...rest} />
