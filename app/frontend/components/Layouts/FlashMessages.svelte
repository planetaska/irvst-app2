<script>
  import { page } from '@inertiajs/svelte'

  // list color classes to prevent purge by Tailwind
  // bg-red-50
  // text-red-400
  // text-red-800
  // bg-blue-50
  // text-blue-400
  // text-blue-800
  // bg-green-50
  // text-green-400
  // text-green-800

  let color = 'green'

  $: flash = $page.props.flash
  $: show = $page.props.has_flash

  let msg = ''

  $: if (show) {
    if (flash.alert) {
      color = 'red'
      msg = flash.alert
    }

    if (flash.notice) {
      color = 'blue'
      msg = flash.notice
    }

    if (flash.success) {
      color = 'green'
      msg = flash.success
    }
  }
</script>

{#if show}
  <div class="mx-auto max-w-7xl rounded-md bg-{color}-50 p-4 mb-4">
    <div class="flex">
      <div class="flex-shrink-0">
        <svg class="h-5 w-5 text-{color}-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
          <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="ml-3">
        <h3 class="text-sm font-medium text-{color}-800">{msg}</h3>
      </div>
    </div>
  </div>
{/if}