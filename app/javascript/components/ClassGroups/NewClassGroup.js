import React from 'react';

import Card from '../UI/Card.js';
import './NewClassGroup.css';

const NewClassGroup = (props) => {
  const addClassHandler = (event) => {
    event.preventDefault();
  }

  return (
    <div>
      <div className="addClass__backdrop" onClick={props.onConfirm} />
      <Card className="addClassCard">
        <form onSubmit={addClassHandler} className="addClass__input">
          <label htmlFor="classname">Class Name</label>
          <input id="classname" type="text" />
          <label htmlFor="studentNumber">Number of Students</label>
          <input id="studentNumber" type="number" />
          <h3>Desk Layout</h3>
          <div className="rows_columns">
            <label htmlFor="rows">Rows</label>
            <input id="rows" type="number"/>
            <label htmlFor="columns">Columns</label>
            <input id="columns" type="number"/>
          </div>
          <button type="cancel">Cancel</button>
          <button type="submit">Add Class</button>
        </form>
      </Card>
    </div>
  )
};

export default NewClassGroup;