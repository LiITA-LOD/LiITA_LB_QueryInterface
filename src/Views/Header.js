import React from 'react';
import PropTypes from 'prop-types';
// import AppBar from '@material-ui/core/AppBar';
// import Avatar from '@material-ui/core/Avatar';
// import Button from '@material-ui/core/Button';
// import Grid from '@material-ui/core/Grid';
// import HelpIcon from '@material-ui/icons/Help';
// import Hidden from '@material-ui/core/Hidden';
import IconButton from '@material-ui/core/IconButton';
// import Link from '@material-ui/core/Link';
import MenuIcon from '@material-ui/icons/Menu';
// import NotificationsIcon from '@material-ui/icons/Notifications';
// import Tab from '@material-ui/core/Tab';
// import Tabs from '@material-ui/core/Tabs';
// import Toolbar from '@material-ui/core/Toolbar';
// import Tooltip from '@material-ui/core/Tooltip';
// import Typography from '@material-ui/core/Typography';
import { withStyles } from '@material-ui/core/styles';

const lightColor = 'rgba(255, 255, 255, 0.7)';

const styles = theme => ({
  secondaryBar: {
    zIndex: 0,
  },
  menuButton: {
    marginLeft: -theme.spacing(1),
  },
  iconButtonAvatar: {
    padding: 4,
  },
  link: {
    textDecoration: 'none',
    color: lightColor,
    '&:hover': {
      color: theme.palette.common.white,
    },
  },
  button: {
    borderColor: lightColor,
  },
});

function Header(props) {
  const { classes, onDrawerToggle } = props;

  return (
    <React.Fragment>
      {/*<Hidden smUp   style={{width:"36px"}}>*/}

        <IconButton
            color="inherit"
            aria-label="open drawer"
            onClick={onDrawerToggle}
            className={classes.menuButton}
            style={{width:"40px", marginLeft:"12px"}}
        >
          <MenuIcon />
        </IconButton>

      {/*</Hidden>*/}

    </React.Fragment>
  );
}

Header.propTypes = {
  classes: PropTypes.object.isRequired,
  onDrawerToggle: PropTypes.func.isRequired,
};

export default withStyles(styles)(Header);
