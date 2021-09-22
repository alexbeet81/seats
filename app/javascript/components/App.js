import React from 'react'
import { Route, Switch } from 'react-router-dom'
import ClassGroup from './ClassGroup/ClassGroup';
import ClassGroups from './ClassGroups/ClassGroups';

const App = () => {
  return (
    <Switch>
      <Route exact path="/" component={ClassGroups} />
      <Route exact path="/class_groups/:slug" component={ClassGroup} />
    </Switch>
  )
};

export default App