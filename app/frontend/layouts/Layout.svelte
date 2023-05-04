<script>
  import MainNav from "../components/Layouts/MainNav.svelte";
</script>

<div class="bg-white">
  <MainNav />
  <main>
    <div class="max-w-7xl mx-auto px-4 sm:px-8">
      <slot/>
    </div>
  </main>
</div>