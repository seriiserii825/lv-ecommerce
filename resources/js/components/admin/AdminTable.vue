<template>
    <div class="admin-table">
        <slot></slot>
    </div>
</template>
<script>
export default {};
</script>
<style lang="scss">
.admin-table {
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th,
    td {
        padding: 1rem;
        border: 1px solid #444;
        &:nth-of-type(7) {
            width: 17rem;
        }
    }
    th {
        color: white;
        background-color: #444;
        a {
            text-decoration: none;
            color: white;
        }
    }
    tr:nth-of-type(even) {
        background-color: #bbb;
    }
    td {
        img {
            box-shadow: 0 0 5px 1px rgba(0, 0, 0, 0.3);
        }
        h3 {
            font-weight: bold;
        }
    }
    &__actions {
        display: flex;
        align-items: center;
        a {
            margin-right: 1rem;
        }
    }
}
</style>
