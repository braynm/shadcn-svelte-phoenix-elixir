<script>
	import DotsHorizontal from "svelte-radix/DotsHorizontal.svelte";
	import { cn } from "$lib/utils.js";
	let className = undefined;
	export { className as class };
</script>

<span
	aria-hidden
	class={cn("flex h-9 w-9 items-center justify-center", className)}
	{...$$restProps}
>
	<DotsHorizontal class="h-4 w-4" />
	<span class="sr-only">More pages</span>
</span>
