<template>
    <div class="media-grid">
        <header class="media-grid__header">
            <input
                class="media-grid__search"
                v-model="search"
                @input="searchInput"
                type="text"
                placeholder="Search media...."
            />
            <div @click="closeMediaGrid" class="el-icon-circle-close"></div>
        </header>
        <div class="media-grid__wrap" v-if="searchedItems.length">
            <div
                class="media-grid__item"
                v-for="item in searchedItems"
                :key="item.id"
            >
                <media-grid-item
                    :title="item.title"
                    :path="item.path"
                    @add-image="add_image"
                    @remove-image="remove_image"
                />
            </div>
        </div>
        <el-button type="primary" @click="emit_images">Add images</el-button>
    </div>
</template>
<script>
import MediaGridItem from "./MediaGridItem.vue";

export default {
    props: {
        single: {
            type: Boolean,
            default: true,
        },
    },
    components: {MediaGridItem},
    data() {
        return {
            items: [],
            images: [],
            search: "",
            searchedItems: [],
        };
    },
    methods: {
        searchInput() {
            if (this.search.length > 0) {
                this.searchedItems = this.searchedItems.filter((item) => {
                    return item.title.includes(this.search);
                });
            } else {
                this.searchedItems = this.items;
            }
        },
        emit_images() {
            if (this.single) {
                this.$emit("emit_images", [this.images[0]]);
            } else {
                this.$emit("emit_images", this.images);
            }
            this.closeMediaGrid();
        },
        add_image(value) {
            this.images.push(value);
        },
        remove_image(value) {
            this.images = this.images.filter((item) => {
                return item !== value;
            });
        },
        closeMediaGrid() {
            this.$emit("handler");
        },
        getItems() {
            axios.get("/api/media")
                .then((res) => {
                    this.items = res.data.data;
                    this.searchedItems = this.items;
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
    mounted() {
        this.getItems();
        document.addEventListener("keydown", (e) => {
            if (e.key === "Escape") {
                this.closeMediaGrid();
            }
        });
    },
};
</script>
<style lang="scss">
.media-grid {
    position: fixed;
    top: 0;
    left: 0;
    padding: 4rem;
    width: 100%;
    height: 100%;
    background-color: #f4f4f4;
    z-index: 10000;
    &__header {
        margin-bottom: 5rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        .el-icon-circle-close {
            font-size: 4rem;
            color: red;
            cursor: pointer;
        }
    }
    &__search {
        width: 30rem;
        height: 3rem;
        background-color: #eee;
        border: 1px solid #ccc;
    }
    &__wrap {
        display: flex;
        justify-content: flex-start;
        flex-wrap: wrap;
        margin-bottom: 2rem;
        height: 62vh;
        padding: 3rem;
        background-color: #ddd;
        overflow: hidden;
    }
    &__item {
        position: relative;
        margin-right: 2rem;
        margin-bottom: 2rem;
    }
}
</style>
