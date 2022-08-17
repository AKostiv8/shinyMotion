import * as React from "react";
import { motion } from "framer-motion";

const variants = {
  open: {
    y: 0,
    opacity: 1,
    visibility: 'visible',
    transition: {
      y: { stiffness: 1000, velocity: -100 }
    }
  },
  closed: {
    y: 50,
    opacity: 0,
    visibility: 'hidden',
    transition: {
      y: { stiffness: 1000 }
    }
  }
};

function MenuItem({ color, redirectTo, title }) {
    const style = { border: `2px solid ${color}` };
    return (
      <motion.li
        variants={variants}
        whileHover={{ scale: 1.1 }}
        whileTap={{ scale: 0.95 }}
      >
        <a className="routeLinkStyle" href={redirectTo}>
            <div className="icon-placeholder" style={style}></div>
            <div className="text-placeholder" style={style}>{title}</div>
        </a>
      </motion.li>
    );
  }

export default MenuItem;
