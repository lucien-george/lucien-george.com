// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("trix");
require("@rails/actiontext");

import "controllers";
import AOS from 'aos';
import 'stylesheets/tailwind/before.scss';
import 'stylesheets/application.scss';
import 'stylesheets/tailwind/after.scss';
import 'aos/dist/aos.css';
import gtag from './components/analytics';

document.addEventListener('turbolinks:load', () => {
  AOS.init();
});
