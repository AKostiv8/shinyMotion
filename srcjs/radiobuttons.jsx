import { reactShinyInput } from 'reactR';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';


function ControlledRadioButtonsGroup({ configuration, value, setValue }) {

  const handleChange = (event) => {
    setValue(event.target.value);
  };

  return (
    <FormControl className={configuration.className}>
      <FormLabel id="demo-controlled-radio-buttons-group">{configuration.label}</FormLabel>
      <RadioGroup
        row={configuration.row}
        aria-labelledby="demo-controlled-radio-buttons-group"
        name="controlled-radio-buttons-group"
        value={value}
        onChange={handleChange}
      >

        {configuration.valuesList.map(Item => {
            return (
              <FormControlLabel value={Item.value} control={<Radio />} label={Item.title} />
            );
        })}

      </RadioGroup>
    </FormControl>
  );


};

export default function initRadioButtons(){
  reactShinyInput(
    '.radiobuttons',
    'shinyMotion.radiobuttons',
    ControlledRadioButtonsGroup
  );
}
