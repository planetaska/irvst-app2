<svelte:head>
  <title>Login</title>
</svelte:head>

<script>
  import { useForm } from '@inertiajs/svelte'

  let form = useForm({
    user: {
      email: null,
      password: null,
      remember: false,
    }
  })

  function submit() {
    $form.post('/login')
  }
</script>

<form on:submit|preventDefault={submit}>
  <input type="text" bind:value={$form.user.email} />
  {#if $form.errors.email}
    <div class="form-error">{$form.errors.email}</div>
  {/if}
  <input type="text" bind:value={$form.user.password} />
  {#if $form.errors.password}
    <div class="form-error">{$form.errors.password}</div>
  {/if}
  <input type="checkbox" bind:checked={$form.user.remember} /> Remember Me
  <button type="submit" disabled={$form.processing}>Login</button>
</form>