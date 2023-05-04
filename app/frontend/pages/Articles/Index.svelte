<script>
  import New from './New.svelte'
  import { inertia, Link } from '@inertiajs/svelte'

  let show = false

  function toggleShow() {
    show = !show
  }

  export let articles
</script>

<h1 className="font-bold text-2xl mb-6">All Articles</h1>

<button on:click={ toggleShow } >New Article</button>

{#if show}
  <New/>
{/if}

<div className="mt-6">
  {#each articles as article}
    <div>
      <Link href="/articles/{article.id}">{article.title}</Link>
      <Link href="/articles/{article.id}/edit">Edit</Link>
      <button use:inertia="{{ href: '/articles/'+article.id, method: 'delete' }}" type="button"
              className="text-indigo-600 hover:text-indigo-900">Delete
      </button>
    </div>
  {/each}
</div>
