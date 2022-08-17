import { reactShinyInput } from 'reactR';
import { Button } from '@mui/material';
import './index.css';


function MaterialButton({ configuration, value, setValue }) {
  return(
    <Button
      className={`buttonCustomAdjustment ${configuration.className}`}
      color={configuration.color}
      size={configuration.size}
      disabled={configuration.disabled}
      variant={configuration.variant}
      onClick={() => setValue(value + 1)}
    >{configuration.label}</Button>
  )
};

export default function initActionButton(){
  reactShinyInput(
    '.action_button',
    'shinyMotion.action_button',
    MaterialButton
  );
}

