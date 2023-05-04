<script>
  import { useForm } from '@inertiajs/svelte'

  let form = useForm({
    title: null,
    body: null
  })

  function submit() {
    $form.post('/articles')
  }
</script>

<form on:submit|preventDefault={submit}>
  <input type="text" bind:value={$form.title} />
  {#if $form.errors.title}
    <div class="form-error">{$form.errors.title}</div>
  {/if}
  <input type="text" bind:value={$form.body} />
  {#if $form.errors.body}
    <div class="form-error">{$form.errors.body}</div>
  {/if}
  <button type="submit" disabled={$form.processing}>Submit</button>
</form>