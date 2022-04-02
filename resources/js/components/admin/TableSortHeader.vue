<template>
    <div>
        <a href="#" @click.prevent="sort_table(table_column)">{{ title }}</a>
        <span v-if="sort_field === table_column && sort_direction === 'asc'" >&uarr;</span >
        <span v-if="sort_field === table_column && sort_direction === 'desc'" >&darr;</span >
    </div>
</template>
<script>
export default {
    props: {
        title: String,
        table_column: String,
        sort_field: String,
        sort_direction: String,
    },
    methods: {
        sort_table() {
            this.$emit("sort_table", this.table_column);
        },
    },
};
</script>
