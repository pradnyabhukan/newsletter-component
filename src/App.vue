<style lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
  .newsletter{
    background: white;
    display: flex;
    flex-direction: row;
    border-radius: 3rem;
    font-family: 'Roboto', sans-serif;
    margin: 2rem;
    width: fit-content;

    &__content {
      margin: 4rem;
    }

    &__image {
      margin: 1.5rem;
    }

    &__content-title {
      font-size: 56px;
      font-weight: 700;
      line-height: 56px;
      text-align: left;
      margin: 2rem 0;
    }

    &__content-body,
    &__content-list {
      font-size: 16px;
      font-weight: 400;
      line-height: 24px;
      text-align: left;
    }

    &__content-list {
      padding: 0.5rem 0;
    }

    &__content-list-item {
      list-style: none;
      margin: 1rem 0;
    }

    &__content-list-icon {
      margin: 0 0.5rem;
    }

    &__content-form {
      display: flex;
      flex-direction: column;
    }

    &__content-form-email-tab {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }

    &__content-form-email,
    &__content-form-error-msg {
      font-size: 12px;
      font-weight: 700;
      line-height: 18px;
      text-align: left;
    }

    &__content-form-error-msg {
      color: #FF6155;
    }

    &__content-form-input,
    &__content-form-button {
      margin-bottom: 1rem;
      padding: 1rem;
      border: 0.025rem solid #b9b9b9;
      border-radius: 0.5rem;
    }

    &__content-form-input {
      font-size: 16px;
      font-weight: 400;
      line-height: 24px;
      padding: 0.5rem 2rem;

      &:focus {
        outline: none;
        border: 0.025 solid black;
      }
    }

    &__content-form-input--error {
      background: hsla(4, 100%, 67%, 0.15);
      color: #FF6155;
      border: 0.025rem solid #FF6155;
    }

    &__content-form-button {
      background: #242742;
      color: white;
      font-size: 16px;
      font-weight: 700;
      text-align: center;
      cursor: pointer;

      &:hover {
        background: linear-gradient(to bottom, #FF6A3A 0%, #FF527B 100%);
      box-shadow: 0px 16px 32px 0px hsla(4, 100%, 67%, 0.5);
      }
    }
  }

  .success-dialog {
    background: white;
    margin: 2rem;
    border-radius: 3rem;
    font-family: 'Roboto', sans-serif;
    width: 504px;
    height: 520px;

    &__body {
      padding: 3rem;
    }

    &__title {
      font-size: 56px;
      font-weight: 700;
      line-height: 56px;
      text-align: left;
      margin: 1.25rem 0;
    }

    &__content {
      font-size: 16px;
      font-weight: 400;
      line-height: 24px;
      text-align: left;
    }

    &__body-icon {
      width: 64px;
    }

    &__body-button {
      margin-bottom: 1rem;
      padding: 1rem;
      width: 100%;
      border: 0.025rem solid #b9b9b9;
      border-radius: 0.5rem;
      background: #242742;
      color: white;
      font-size: 16px;
      font-weight: 700;
      line-height: 24px;
      text-align: center;
      cursor: pointer;

      &:hover {
        background: linear-gradient(to bottom, #FF6A3A 0%, #FF527B 100%);
        box-shadow: 0px 16px 32px 0px hsla(4, 100%, 67%, 0.5);
      }

    }
  }

  .desktop-image {
    display: block;
  }

  .mobile-image {
    display: none;
    width: 100%;
  }

  .attribution {
    color: white;
  }

  @media screen and (max-width: 920px) {

    .desktop-image {
      display: none;
    }

    .mobile-image {
      display: block;
      border-radius: 3rem;
    }
    .newsletter {
      display: flex;
      flex-direction: column-reverse;
      height: auto;
      width: 100%;
      border-radius: 3rem;
      margin: 0;

      &__image {
        margin: 0;
        padding: 0;
        width: 100%;
      }
    }

    .success-dialog {
      background: white;
      margin: 0;
      border-radius: 0;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;

      &__title,
      &__content,
      &__body-icon,
      &__body-button {
        margin-bottom: 5rem;
      }
    }
  }
</style>
<template>
  <div class="newsletter" v-if="!showSuccessDialog">
    <div class="newsletter__content">
      <p class="newsletter__content-title">Stay Updated!</p>
      <p class="newsletter__content-body">Join 60,000+ product managers receiving monthly updates on:</p>
      <ul class="newsletter__content-list">
        <li class="newsletter__content-list-item">
          <img :src="iconList" class="newsletter__content-list-icon">
          Product discovery and building what matters
        </li>
        <li class="newsletter__content-list-item">
          <img :src="iconList" class="newsletter__content-list-icon">
          Measuring to ensure updates are a success
        </li>
        <li class="newsletter__content-list-item">
          <img :src="iconList" class="newsletter__content-list-icon">
          And much more!
        </li>
      </ul>

      <div class="newsletter__content-form">
        <div class="newsletter__content-form-email-tab">
          <p class="newsletter__content-form-email">Email Address</p>
          <p 
          v-show="!isValidEmail"
          class="newsletter__content-form-error-msg">Valid email required</p>
        </div>
        <input 
          class="newsletter__content-form-input" 
          :class="{'newsletter__content-form-input--error' : !isValidEmail}"
          type="text"
          placeholder="email@company.com"
          required
          v-model="email"
        />
        <button 
          @click="subscribe"
          class="newsletter__content-form-button"
        >
          Subscribe to monthly newsletter
        </button>
      </div>
    </div>
    <div class="newsletter__image">
      <img :src="illustrationSignUpDesktop" class="desktop-image"/>
      <img :src="illustrationSignUpMobile" class="mobile-image"/>
    </div>
  </div>
  <div class="success-dialog" v-if="showSuccessDialog">
    <div class="success-dialog__body">
      <img :src="iconList" class="success-dialog__body-icon">
      <p class="success-dialog__title">Thanks for Subscribing!</p>
      <p class="success-dialog__content">
        A confirmation email has been send to <b>{{ email }}</b>.
        Please open it and click the button inside to confirm your subscription.
      </p>
      <button
        @click="closeDialog"
        class="success-dialog__body-button"
      >
        Dismiss Message
      </button>
    </div>
  </div>
  <div class="attribution">
    Challenge by <a class="attribution" href="https://www.frontendmentor.io?ref=challenge" target="_blank">Frontend Mentor</a>. 
    Coded by <a class="attribution" href="https://github.com/pradnyabhukan" target="blank">Pradnya Bhukan</a>.
  </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import illustrationSignUpDesktop from '../assets/images/illustration-sign-up-desktop.svg';
import illustrationSignUpMobile from '../assets/images/illustration-sign-up-mobile.svg'
import iconList from '../assets/images/icon-list.svg'

export default defineComponent({
  name: 'App',
  setup() {
    const email = ref('');
    const isValidEmail = ref(true);
    const showSuccessDialog = ref(false);

    return {
      illustrationSignUpDesktop,
      illustrationSignUpMobile,
      iconList,
      email,
      isValidEmail,
      showSuccessDialog,
      subscribe() {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        isValidEmail.value = regex.test(email.value);
        if(isValidEmail.value) {
          showSuccessDialog.value = true;
        } else {
          console.log('Invalid email entered!');
        }
      },
      closeDialog() {
        showSuccessDialog.value = false;
      }
    }
  }
})
</script>
