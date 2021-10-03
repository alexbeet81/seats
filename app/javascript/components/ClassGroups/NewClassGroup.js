import React, {useState} from 'react';

import Card from '../UI/Card.js';
import Button from '../UI/Button.js';
import './NewClassGroup.css';

const NewClassGroup = (props) => {
  const [enteredClassName, setEnteredClassName] = useState('');
  const [enteredDeskNumber, setEnteredDeskNumber] = useState(0);
  const [enteredRows, setEnteredRows] = useState(0);
  const [enteredColumns, setEnteredColumns]= useState(0);

  const classNameChangeHandler = (event) => {
    setEnteredClassName(event.target.value)
  }

  const deskNumberChangeHandler = (event) => {
    setEnteredDeskNumber(event.target.value)
  }

  const rowsChangeHandler = (event) => {
    setEnteredRows(event.target.value)
  }

  const columnsChangeHandler = (event) => {
    setEnteredColumns(event.target.value)
  }



  const addClassHandler = (event) => {
    event.preventDefault();
    console.log(enteredClassName);
    console.log(enteredDeskNumber);
    console.log(enteredRows);
    console.log(enteredColumns);
  }

  return (
    <div>
      <div className="addClass__backdrop" onClick={props.onDismiss} />
      <Card className="addClassCard">
        <form onSubmit={addClassHandler} className="addClass__input">
          <label htmlFor="classname">class name</label>
          <input id="classname" type="text" placeholder="enter class name" onChange={classNameChangeHandler}/>
          <label htmlFor="deskNumber">number of desks</label>
          <input id="deskNumber" type="number" placeholder="enter number of desks" onChange={deskNumberChangeHandler}/>
          <h3 className="rows_columns__header">desk layout</h3>
          <div className="rows_columns">
            <label htmlFor="rows">Rows</label>
            <input id="rows" type="number" onChange={rowsChangeHandler}/>
            <label htmlFor="columns">Columns</label>
            <input id="columns" type="number" onChange={columnsChangeHandler}/>
          </div>
          <div className="addClassFrom__buttons">
            <Button 
              className="addClassForm__btn_cancel" 
              type="cancel"
              onClick={props.onDismiss}>Cancel</Button>
            <Button type="submit">Add Class</Button>
          </div>
        </form>
      </Card>
    </div>
  )
};

export default NewClassGroup;