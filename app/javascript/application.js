// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//import "@hotwired/turbo-rails"
import jQuery from 'jquery'
window.$ = jQuery;
window.jQuery = jQuery;
import Rails from '@rails/ujs';

Rails.start();

//import "controllers"

import "bootstrap"
