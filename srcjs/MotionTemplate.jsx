import { reactWidget } from 'reactR';
import MotionTemplate from './MotionTemplate.js';
import Navigation from './MainContent.js'
import initActionButton from './action_button.jsx';
import initSelect from './select_input.jsx';
import initInputField from './input_field.jsx';
import initRadioButtons from './radiobuttons.jsx';
import initSlider from './slider.jsx';


reactWidget('MotionTemplate', 'output', {
  MotionContainer: MotionTemplate
});

reactWidget('contentContainer', 'output', {
  MainContent: Navigation
});

initActionButton();
initSelect();
initInputField();
initRadioButtons();
initSlider();
