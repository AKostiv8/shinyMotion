import * as React from "react";
import { motion } from "framer-motion";
import MenuItem from "./MenuItem";
import './index.css';

const variants = {
  open: {
    transition: { staggerChildren: 0.07, delayChildren: 0.2 }
  },
  closed: {
    transition: { staggerChildren: 0.05, staggerDirection: -1 }
  }
};

function Navigation(props) {
    return(
        <motion.ul variants={variants}>
          {props.menuData !== undefined ?
          <>
           {props.menuData.map(menuItem => {
            return (
              <MenuItem color={menuItem.color} title={menuItem.title} redirectTo={menuItem.routeLink}/>
            );
           })}
           </>
           : null
          }

        </motion.ul>
    );
}

export default Navigation;
