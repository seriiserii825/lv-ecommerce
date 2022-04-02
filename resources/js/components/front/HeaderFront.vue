<template>
    <header class="main-header">
        <div class="container">
            <div class="main-header__wrap">
                <div class="logo">
                    <img src="https://seriiburduja.ru/wp-content/uploads/2022/03/me.jpg" alt="">
                </div>
                <div class="main-header__profile profile">
                    <h1 class="profile__title">Сергей Бурдужа</h1>
                    <h2 class="profile__subtitle">Web App Developer</h2>
                    <ul class="main-header__socials socials">
                        <li>
                            <a target="__blank" href="https://github.com/seriiserii825">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 512">
                                    <!--! Font Awesome Pro 6.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                    <path
                                        d="M186.1 328.7c0 20.9-10.9 55.1-36.7 55.1s-36.7-34.2-36.7-55.1 10.9-55.1 36.7-55.1 36.7 34.2 36.7 55.1zM480 278.2c0 31.9-3.2 65.7-17.5 95-37.9 76.6-142.1 74.8-216.7 74.8-75.8 0-186.2 2.7-225.6-74.8-14.6-29-20.2-63.1-20.2-95 0-41.9 13.9-81.5 41.5-113.6-5.2-15.8-7.7-32.4-7.7-48.8 0-21.5 4.9-32.3 14.6-51.8 45.3 0 74.3 9 108.8 36 29-6.9 58.8-10 88.7-10 27 0 54.2 2.9 80.4 9.2 34-26.7 63-35.2 107.8-35.2 9.8 19.5 14.6 30.3 14.6 51.8 0 16.4-2.6 32.7-7.7 48.2 27.5 32.4 39 72.3 39 114.2zm-64.3 50.5c0-43.9-26.7-82.6-73.5-82.6-18.9 0-37 3.4-56 6-14.9 2.3-29.8 3.2-45.1 3.2-15.2 0-30.1-.9-45.1-3.2-18.7-2.6-37-6-56-6-46.8 0-73.5 38.7-73.5 82.6 0 87.8 80.4 101.3 150.4 101.3h48.2c70.3 0 150.6-13.4 150.6-101.3zm-82.6-55.1c-25.8 0-36.7 34.2-36.7 55.1s10.9 55.1 36.7 55.1 36.7-34.2 36.7-55.1-10.9-55.1-36.7-55.1z"></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="btn-wrap">
                    <a href="/portfolio" class=" btn">
                        <div class="btn__wrap">
                            <span>Portfolio</span>
                        </div>
                    </a>
                    <a target="__blank" href="https://telegram.im/@serii_burduja" class=" btn">
                        <div class="btn__wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512">
                                <path
                                    d="M248,8C111.033,8,0,119.033,0,256S111.033,504,248,504,496,392.967,496,256,384.967,8,248,8ZM362.952,176.66c-3.732,39.215-19.881,134.378-28.1,178.3-3.476,18.584-10.322,24.816-16.948,25.425-14.4,1.326-25.338-9.517-39.287-18.661-21.827-14.308-34.158-23.215-55.346-37.177-24.485-16.135-8.612-25,5.342-39.5,3.652-3.793,67.107-61.51,68.335-66.746.153-.655.3-3.1-1.154-4.384s-3.59-.849-5.135-.5q-3.283.746-104.608,69.142-14.845,10.194-26.894,9.934c-8.855-.191-25.888-5.006-38.551-9.123-15.531-5.048-27.875-7.717-26.8-16.291q.84-6.7,18.45-13.7,108.446-47.248,144.628-62.3c68.872-28.647,83.183-33.623,92.511-33.789,2.052-.034,6.639.474,9.61,2.885a10.452,10.452,0,0,1,3.53,6.716A43.765,43.765,0,0,1,362.952,176.66Z"></path>
                            </svg>
                            <span>Telegram</span>
                        </div>
                    </a>
                    <router-link :to="{name: 'login'}" class="btn">
                        <div class="btn__wrap">
                            <span>Login</span>
                        </div>
                    </router-link>
                </div>
            </div>
        </div>
    </header>
</template>
<script>
export default {

}
</script>
<style lang="scss">
.main-header {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: white;
    border-top: 1rem solid #778492;
    box-shadow: 0 2px 8px -4px rgba(0, 0, 0, 0.2);
    .container {
        position: relative;
    }
    &__wrap {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 3rem 0;
        @media screen and (max-width: 768px) {
            flex-wrap: wrap;
            flex-direction: column;
            justify-content: center;
        }
    }
    .logo {
        position: relative;
        margin-right: 3rem;
        width: 18rem;
        height: 18rem;
        z-index: 2;
        border-radius: 50%;
        overflow: hidden;
        transition: all .4s;
        @media screen and (max-width: 768px) {
            margin-right: 0;
        }
        &:hover {
            filter: blur(0.1rem) grayscale(1);
            transform: scale(0.9);
        }
        img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    }
    &__socials {
        @media screen and (max-width: 768px) {
            margin-bottom: 3rem;
            justify-content: center;
        }
    }
    &__profile {
        margin-right: auto;
        @media screen and (max-width: 768px) {
            margin-right: 0;
        }
    }
    .btn {
        margin-left: 1rem;
    }
}
.profile {
    @media screen and (max-width: 768px) {
        text-align: center;
    }
    &__title {
        font-size: 3.8rem;
        margin-bottom: 0.5rem;
        margin-top: 3rem;
    }
    &__subtitle {
        margin-bottom: 1.5rem;
        font-weight: 400;
        font-size: 2.4rem;
        color: #778492;
    }
}
.socials {
    display: flex;
    align-items: center;
    a {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 3.6rem;
        height: 3.6rem;
        background-color: darken(#ccc, 20%);
        border-radius: 50%;
        transition: all .4s;
        &:hover {
            background: green;
        }
        svg {
            width: 2rem;
            height: auto;
            fill: white;
        }
    }
}
</style>

