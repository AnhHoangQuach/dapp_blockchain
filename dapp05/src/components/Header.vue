<template>
    <div class="header-container">
        <div class="header-content">
            <div class="logo">
                <img v-bind:src="imgURL" alt="">
            </div>
            <div class="menu">
                <ul class="menu__navbar-list">
                    <li v-for="(item, index) in listNavBar" :key="index">
                        <a class="menu__navbar-list-item" :class="(item.isActive == true || item.name == 'SUN') ? 'color_change': ' '" 
                            :href="item.name"
                            @mouseover="mouseChange(item)" @mouseout="mouseChange(item)">
                            {{item.name}}
                            <transition name="fade">
                                <ul class="menu__navbar-dropdown" v-show='item.isDropdown'>
                                    <li v-for="(ele,index) in item.items" :key="index"> 
                                        <a class="menu__navbar-dropdown-item" :href="ele.link" target="_blank">{{ele.name_link}}</a>
                                    </li>
                                </ul>
                            </transition>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="header__right">
                <div class="header__right-connect-wallet" @click="showModal">Connect to Wallet</div>
                <app-modal v-show="isModalVisible" @close="closeModal"></app-modal>
                <b-form-select class="header__right-language"
                    v-model="selected"
                    :options="languages"
                ></b-form-select>
            </div>
        </div>
    </div>
</template>

<script>
import Modal from './Modal.vue';
export default {
    props: {
        imgURL: {
            type: String,
            default: "src/assets/sunLogo.png",
        },
        listNavBar: {
            type: Array,
        },
        languages: {
            type: Array,
        },
    },

    data: function() {
        return {
            selected: 'English',
            isModalVisible: false,
        }
    },
    methods: {
        mouseChange: function(item) {
            item.isActive = !item.isActive;
            if(item.name == 'Learn') {
                item.isActive = false;
                item.isDropdown = !item.isDropdown;
            }
        },
        showModal() {
            this.isModalVisible = true;
        },
        closeModal() {
            this.isModalVisible = false;
        }
    },
    components: {
        appModal: Modal,
    }
}
</script>

<style lang="scss" scoped>

    .menu__navbar-dropdown-item {
        text-decoration: none;
        color: #333;
        display: block;
    }

    .menu__navbar-dropdown-item:hover {
        color: #6726eb;
    }

    .header-container {
        background-image: url('../assets/bg_header.png');
        background-size: 100%;
        height: 400px;
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
        .header-content {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            padding: 15px 2vw;
            color: #fff;
            font-family: HelveticaNeue;
        }

        .logo {        
            img {
                width: 150px;
            }
        }

        .menu {
            width: 20rem;
            height: 2.875rem;
            margin-left: 8rem;
        }

        .menu__navbar-list {
            list-style: none;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 0;
            height: 100%;
            position: relative;
            z-index: 99;
        }

        .menu__navbar-list-item{
            padding: 6px 14px;
            box-sizing: border-box;
            border-radius: 5px;
            margin: 0px 10px;
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .color_change {
            background-color: #6726eb;
        }

        .header__right {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .header__right-connect-wallet {
            background: #6726eb;
            border-radius: 5px;
            font-size: 14px;
            padding: 7px 30px;
            color: #fff;
            text-align: center;
            cursor: pointer;
            margin-right: 2rem;
        }

        .header__right-language {
            width: 6rem;
        }
    }

    .menu__navbar-dropdown {
        position: absolute;
        background: #fff;
        top: 3rem;
        padding: 0 4rem 0 1rem;
        margin: 0;
    }

    .menu__navbar-dropdown li {
        color: #6c757d;
        list-style: none;
        line-height: 3rem;
    }

    .fade-enter-active, .fade-leave-active {
        transition: opacity .2s;
    }

    .fade-enter, .fade-leave-active {
        opacity: 0;
    }
</style>