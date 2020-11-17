<template>
    <div class="about__list-container">
        <div class="about__list-title">FAQ</div>
        <div class="about__list-content">
            <ul class="about__list-content-rules">
                <li>
                    <h3 class="question">1.What is SUN?</h3>
                    <p>SUN token is a social experiment dedicated to the development of TRON's DeFi ecosystem. Designed as the quintessential Bitcoin equivalent on TRON, SUN features zero VC investments, zero PE investments, no pre-mining or reserve for the team, and is fully operated by the community through its 
                    open-source smart contracts. SUN is a TRC20-based crypto asset with a total supply of 19900730.
                    </p>
                    <p>We hope to leverage SUN to promote the vigorous development of TRON's self-governing DeFi community.</p>
                </li>
                <li>
                    <h3 class="question">2.How to participate in LP mining?</h3>
                    <p>Each mining pool follows its own schedule for start, ending and mining speed. You may check 
                        <a href="https://sun.io/?lang=en-US#/rules" target="_blank">"Mining rules"</a>
                        for more information.
                    </p>
                </li>
                <li>
                    <h3 class="question">3.How to participate in mining?</h3>
                    <p>You need TRX or Token on 
                        <a href="https://justswap.io/?lang=en-US#/home">JustSwap</a>
                        to participate in mining. Select the corresponding pool and enter the amount of tokens you want to stake. You are ready to harvest SUN. Here are the detailed steps: 
                    </p>
                    <p>Select the corresponding pool.</p>
                    <p>Approval is needed when first staking Token. Click "Approve LP". And click "Accept” in the TronLink popup window for your signature to complete Token approval;</p>
                    <p>Once the token is approved, enter the amount of Tokens you want to stake, and click "Stake". And click "Accept" in the TronLink popup window for your signature;</p>
                    <p>Wait for 15-30 seconds after you submit your staking request. You can then view the number of Tokens you have staked and the SUN you can claim in the pool.</p>
                </li>
                <li>
                    <h3 class="question">4.How to check and claim my SUN rewards?</h3>
                    <p>You may have some SUN left in your current and previous pools. You can check them out by clicking "Pending Claim".</p>
                    <p>1) SUN can be claimed separately only from pools that are still active.</p>
                    <p>2) Find the pool you participated in from the "Active" tab on the homepage. Click on "Select" and you will see a "Stake & Claim" popover.</p>
                    <p>3) Switch the popover status to "Claim" and click "Claim" in the "Pending Claim" column. You will see a popover from TronLink asking for your signature. Click "Accept" to claim rewards.</p>
                </li>
                <li>
                    <h3 class="question">5.How to migrate staked assets to new mining pools?</h3>
                    <p>
                        <strong>.</strong>
                        To expedite the process of participating in new pools, the platform allows users to migrate staked assets to new pools of the same token with a single click.
                    </p>
                    <p>If you have staked assets in ended pools, In the ended tab, select the pool you have participated in, and click "Continue mining to enjoy higher profits" to start the migration process.</p>
                    <p>Migration process:</p>
                    <p>1) After clicking the "Continue mining for more profits" button, you will see instructions in a popover, which usually consists of three steps: "Authorize the pool to access XXX", "Unlock assets from original pools" and "Migrate unlocked assets to new pool". Your signature is needed for each step.</p>
                    <p>2) Migration will finish after you sign all the three steps.</p>
                    <p>Note: Migration can only succeed after each step is confirmed as a transaction on-chain. Within a minute after migration, you may receive a message saying your migration failed. In that case, you can either retry or unlock and stake your assets manually.</p>
                </li>
                <li>
                    <h3 class="question">6.How to unlock staked assets？</h3>
                    <p>
                        You can unlock your staked assets anytime whether the pool you joined is still running or not. You can enter the amount you want to unlock from pools that are active. For pools that are now ended, however, you will have to unlock all assets at once.
                    </p>
                    <p><strong>.</strong> For active pools, please follow the steps below to "Claim & Unlock" assets:</p>
                    <p>1) Find the pool you participated in from the "Active" tab on the homepage. Click on "Select" and you will see a popover.</p>
                    <p>2) Switch the popover to the "Claim" page and enter the amount you want to unlock at "My Staked".</p>
                    <p>3) Click "Claim and Unlock" and you will see a popover from TronLink asking for your signature. Click "Accept" to claim and unlock your assets.</p>
                    <p><strong>.</strong> For ended pools, please follow the steps below to "Claim & Unlock" assets:</p>
                    <p>1) Find the pool you participated in the "Ended" tab on the homepage. Click "Claim and Unlock".</p>
                    <p>2) You will see a popover from TronLink asking for your signature. Click "Accept" to claim and unlock your assets.</p>
                </li>
                <li>
                    <h3 class="question">7.Why does ‘My Earned’ show “0”?</h3>
                    <p>
                        There are several reasons:
                    </p>
                    <p>1) The amount of SUN you earned is too small. Our asset field displays three digits after the decimal point and the number won’t show if it is too small.</p>
                    <p>2) You have just staked your tokens, and the number won’t be displayed immediately. So please wait patiently until the information shows.</p>
                </li>
                <li>
                    <h3 class="question">8.Phases of SUN Mining</h3>
                    <p>
                        <strong>.</strong> Phase 1: Genesis Mining
                    </p>
                    <p>According to the design of the smart contract code, the amount of tokens mined will not be decreased. Staked TRX can only be unlocked til Genesis Mining concludes. A one-off SUN reward will be distributed after the completion of Genesis Mining in 24 hours.</p>
                    <p>
                        <strong>.</strong> Phase 2: Regular Mining
                    </p>
                    <p>According to the design of the smart contract code, staked TRX can be unlocked anytime during the Regular Mining period for SUN reward.</p>
                    <p>
                        <strong>.</strong> Phase 3: Ecosystem Convergence
                    </p>
                    <p>Integrating to multiple DeFi projects within the TRON ecosystem.</p>
                    <p>
                        <strong>.</strong> Phase 4: Community Self-Governance
                    </p>
                    <p>SUN holders will join in governing the SUN community. The more SUN they own, the greater power they have.</p>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            isActive: true,
        }
    },
    methods: {

    },
}
</script>

<style lang="scss">
    strong {
        font-weight: bolder;
    }

    .about__list-container {
        width: 56.25%;
        margin: 0 auto;
        position: relative;
        z-index: 9999;
    }

    .about__list-title {
        font-family: HelveticaNeue-Medium;
        font-size: 46px;
        color: #fff;
        letter-spacing: 0;
        text-align: center;
        margin: 130px 0 110px 0;
    }

    .about__list-content {
        background: #fff;
        box-shadow: 0 20px 40px 0 hsla(0,0%,58%,.06);
        border-radius: 15px;
        padding: 10px 0;
    }

    .question {
        font-family: PingFangSC-Regular;
        font-size: 18px;
        color: #1a1a1a;
        letter-spacing: .3px;
        margin-bottom: 6px;
    }

    .about__list-content-rules {
        text-align: left;
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    .about__list-content-rules li p {
        font-size: 13px;
        letter-spacing: 0;
        font-family: PingFangSC-Regular;
        color: #666;
        line-height: 22px;
        margin-bottom: 0;
    }

    .about__list-content-rules li p a {
        color: #6726eb;
        font-size: 13px;
    }

    .about__list-content-rules li {
        padding: 20px 0;
        margin: 0 30px;
        border-bottom: 1px solid #efefef;
    }
</style>