<script>
	import { Pagination as PaginationPrimitive } from "bits-ui";
	import { buttonVariants } from "$lib/components/ui/button/index.js";
	import { cn } from "$lib/utils.js";
	let className = undefined;
	export let page;
	export let size = "icon";
	export let isActive = false;
	export { className as class };
</script>

<PaginationPrimitive.Page
	bind:page
	class={cn(
		buttonVariants({
			variant: isActive ? "outline" : "ghost",
			size,
		}),
		className
	)}
	{...$$restProps}
	on:click
>
	<slot>{page.value}</slot>
</PaginationPrimitive.Page>
