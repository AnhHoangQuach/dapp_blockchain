<template>
    <div class="header-container">
        <div class="header-content">
            <div class="logo">
                <img v-bind:src="imgURL" alt="">
            </div>
            <div class="menu">
                <ul class="menu__navbar-list">
                    <li v-for="(item) in listNavBar" :key="item.id">
                        <div class="menu__navbar-list-item" @click="changeSelected(item, $event)" 
                            :href="item.name" :class="{active: item.isActive}" >
                            {{item.name}}
                            <transition name="fade">
                                <ul class="menu__navbar-dropdown">
                                    <li v-for="(ele,index) in item.items" :key="index">
                                        <a class="menu__navbar-dropdown-item" :href="ele.link" target="_blank">{{ele.name_link}}</a>
                                    </li>
                                </ul>
                            </transition>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="header__right">
                <div id="idConnect" class="header__right-connect-wallet" @click="showModal">{{addressUser ? addressUser : 'Connect to Wallet'}}</div>
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
import $ from 'jquery';
export default {
    props: {
        isChoice: {
            type: String,
        },
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
        isChoice: {
            type: String,
        }
    },

    data: function() {
        return {
            selected: 'English',
            isModalVisible: false,
            addressUser: '',
        }
    },
    methods: {
        showModal() {
            this.isModalVisible = true;
        },
        closeModal() {
            this.isModalVisible = false;
        },
        changeSelected(item, event) {
            var data = item.name;
            this.listNavBar.forEach(function(itemList, index, array) {
                if(itemList.name === data && data !== 'Learn') {
                    itemList.isActive = true;
                } else {
                    itemList.isActive = false;
                }
            });
            if(data === 'Learn') {
                return;
            }
            this.$emit('selectChoice', data);
        },
        changeConnect() {
            if(this.addressUser != '') {
                $('#idConnect').removeClass('header__right-connect-wallet').addClass('connectSuccess')
                .prepend('<img src="src/assets/tronWallet.svg" style="width: 17px; display: inline-block; margin-right: 10px;">');
            }
        },
    },
    components: {
        appModal: Modal,
    },
    created() {
        this.interval = setInterval(() => {
            if (window.tronWeb && window.tronWeb.defaultAddress.base58) {
                this.addressUser = window.tronWeb.defaultAddress.base58;
            }
        }, 1000);
    },
    updated() {
        setTimeout(() => {
            this.changeConnect();
        }, 0);
    }
}
</script>

<style lang="scss" scoped>

    .active {
        background-color: #6726eb;
    }

    .menu__navbar-list > li:not(:last-child):hover {
        background-color: #6726eb;
        border-radius: 5px;
    }

    .menu__navbar-list-item:last-child:hover .menu__navbar-dropdown {
        display: block;
    }

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
            cursor: pointer;
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

    .connectSuccess {
        background: #fff;
        border-radius: 5px;
        font-size: 14px;
        padding: 7px 30px;
        color: #333;
        text-align: center;
        cursor: pointer;
        margin-right: 2rem;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        max-width: 160px;
        transition: 0.3s all ease;
    }

    .menu__navbar-dropdown {
        position: absolute;
        background: #fff;
        top: 2.2rem;
        padding: 0 4rem 0 1rem;
        margin: 0;
        display: none;
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