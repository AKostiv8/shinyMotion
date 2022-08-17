import { reactShinyInput } from 'reactR';
import { TextField } from '@mui/material';
import './index.css';


function TextInput({ configuration, value, setValue }) {
  return(

   <TextField
      label={configuration.label}
      defaultValue={value}
      helperText={configuration.helperText}
      onChange={e => setValue(e.target.value)}
      id={configuration.styleId}
    />
  )
};

export default function initInputField(){
  reactShinyInput(
    '.input_field',
    'shinyMotion.input_field',
    TextInput
  );
}

