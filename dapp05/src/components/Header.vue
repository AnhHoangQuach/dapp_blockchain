<template>
    <div class="header-container">
        <div class="header-content">
            <div class="logo">
                <img v-bind:src="imgURL" alt="">
            </div>
            <div class="menu">
                <ul class="menu__navbar-list">
                    <li class="menu__navbar-list-item" v-for="(item, index) in listNavBar" :key="index">
                        <a :href="item.name">{{item.name}}</a>
                    </li>
                </ul>
            </div>
            <div class="header__right">
                <div class="header__right-connect-wallet">Connect to Wallet</div>
                <b-form-select class="header__right-language"
                    v-model="selected"
                    :options="languages"
                ></b-form-select>
            </div>
        </div>
    </div>
</template>

<script>
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
        }
    },

    data: function() {
        return {
            selected: 'English',
        }
    },
}
</script>

<style lang="scss" scoped>
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
            background-color: #6726eb;
            border-radius: 5px;
            margin: 0px 10px;
            
            a {
                color: #fff;
                text-decoration: none;
                display: block;
            }
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
</style>