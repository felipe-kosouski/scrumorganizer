<template>
  <div id="app" class="row">
      <div v-for="board in original_boards.boards" class="col-md-3">
        <h6>{{ board.name }}</h6>
        <hr>

        <div v-for="(story, index) in board.stories" class="card card-body">
            {{ story.name }}
        </div>
      </div>
  </div>
</template>

<script>
export default {
  props: ["original_boards"],
}
</script>

<style scoped>

</style>
