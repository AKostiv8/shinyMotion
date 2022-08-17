import { reactShinyInput } from 'reactR';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Stack from '@mui/material/Stack';
import Slider from '@mui/material/Slider';


function valueLabelFormat(value) {
  const units = ['KB', 'MB', 'GB', 'TB'];

  let unitIndex = 0;
  let scaledValue = value;

  while (scaledValue >= 1024 && unitIndex < units.length - 1) {
    unitIndex += 1;
    scaledValue /= 1024;
  }

  return `${scaledValue} ${units[unitIndex]}`;
}

function calculateValue(value) {
  return 2 ** value;
}

function NonLinearSlider({ configuration, value, setValue }) {


  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <Stack sx={{ height: 300 }} spacing={1} direction="row">
      <Slider
        aria-label="Temperature"
        orientation="vertical"
        defaultValue={value}
        onChangeCommitted={handleChange}
        valueLabelDisplay="auto"
        min={configuration.min}
        max={configuration.max}
        defaultValue={configuration.defaultValue}
      />
    </Stack>
  );
}

export default function initSlider(){
  reactShinyInput(
    '.slider',
    'shinyMotion.slider',
    NonLinearSlider
  );
}
