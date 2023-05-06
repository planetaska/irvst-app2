<script>
  import { Link, page, inertia } from '@inertiajs/svelte'
</script>

<nav class="max-w-7xl mx-auto p-6 flex justify-between">
  <ul class="flex items-center space-x-8">
    <li>
      <Link href="/">Home</Link>
    </li>
    <li>
      <Link href="/articles">Articles</Link>
    </li>
    <li>
      <Link href="/about">About</Link>
    </li>
  </ul>

  <div>
    {#if $page.props.auth}
      <button use:inertia="{{ href: '/logout', method: 'delete' }}"
              type="button">
        Sign out
      </button>
    {:else}
      <Link href="/login">Sign in</Link>
    {/if}
  </div>
</nav>