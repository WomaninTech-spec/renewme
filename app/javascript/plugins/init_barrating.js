import "jquery-bar-rating";
import $ from 'jquery';

const initBarRating = () => {
  $('#users_skill_level').barrating({
    theme: 'bars-movie'
  });
};

export { initBarRating };
