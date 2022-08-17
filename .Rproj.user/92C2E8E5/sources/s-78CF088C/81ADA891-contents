import * as React from "react";
import './index.css';
import parse from 'html-react-parser';

import { useRef } from "react";
import { motion, useCycle } from "framer-motion";
import { useDimensions } from "./useDimenssion";
import MenuToggl from './MenuToggl.js';
import Navigation from './MainContent.js';


const sidebar = {
  open: (height = 1000) => ({
    clipPath: `circle(${height * 2 + 200}px at 40px 40px)`,
    transition: {
      type: "spring",
      stiffness: 20,
      restDelta: 2
    }
  }),
  closed: {
    clipPath: "circle(30px at 40px 40px)",
    transition: {
      delay: 0.5,
      type: "spring",
      stiffness: 400,
      damping: 40
    }
  }
};

function MotionTemplate(props) {
  const [isOpen, toggleOpen] = useCycle(false, true);
  const containerRef = useRef(null);
  const { height } = useDimensions(containerRef);

  console.log(props.menuData)

  return (
    <div>
      <motion.nav
        className="asidePanel"
        initial={false}
        animate={isOpen ? "open" : "closed"}
        custom={height}
        ref={containerRef}
      >
      <motion.div className="background" variants={sidebar} />
      <Navigation menuData={props.menuData}/>
      {/* {parse(props.navigation)} */}
      <MenuToggl toggle={() => toggleOpen()} />
    </motion.nav>
    {/* <div className="MainContent"></div> */}
    {parse(props.maincontet)}
    </div>
  );
}

export default MotionTemplate;
