<script lang="ts">
	import LogoLightWordmark from '$components/brand/logo-light-wordmark.svelte';
	import noiseBg from '$assets/noise.png';
</script>

<footer
	class="border-t-4 border-dashed border-primary-300 bg-primary-600"
	style="background-image: url({noiseBg});"
>
	<div class="inner">
		<div class="relative flex gap-12 py-20">
			<div class="grow space-y-4">
				<LogoLightWordmark height="40" />
				<p class="max-w-sm text-primary-200">
					Fast, simple login for any app without the extra hassle.
				</p>
			</div>
			<div class="flex flex-col gap-4">
				<span class="text-sm font-medium text-primary-100 uppercase">Social</span>
				<nav class="flex flex-col gap-2">
					<a href="/" class="text-primary-200 hover:text-primary-100">X</a>
					<a href="/" class="text-primary-200 hover:text-primary-100">LinkedIn</a>
					<a href="/" class="text-primary-200 hover:text-primary-100">Discord</a>
				</nav>
			</div>
			<div class="flex flex-col gap-4">
				<span class="text-sm font-medium text-primary-100 uppercase">Pages</span>
				<nav class="flex flex-col gap-2">
					<a href="/" class="text-primary-200 hover:text-primary-100"> Home </a>
					<a href="/" class="text-primary-200 hover:text-primary-100"> About </a>
					<a href="/" class="text-primary-200 hover:text-primary-100"> Docs </a>
				</nav>
			</div>
		</div>
	</div>
	<p class="border-t border-dashed border-primary-300 py-4 text-center text-sm text-primary-200">
		Made with ☕ by the Cafein team © 2025 Compile Cafe
	</p>
</footer>
