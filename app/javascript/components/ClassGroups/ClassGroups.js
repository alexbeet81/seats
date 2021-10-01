import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import './ClassGroups.css';
import './NewClassGroup';
import NewClassGroup from './NewClassGroup';

const ClassGroups = () => {
  const [classGroups, setClassGroups] = useState([])

  useEffect(() => {
    // Get all of the class groups from api
    // update class groups in state
    axios.get('/api/v1/class_groups.json')
    .then( resp => {
      console.log(resp.data.data)
      setClassGroups(resp.data.data)
    })
    .catch( resp => console.log(resp))
  }, [classGroups.length])

  const classCard = classGroups.map( item => {
    return (
      <div className="class_card">
        <div key={item.attributes.name}>Class Name: {item.attributes.name}</div>
        <h3>students: {item.relationships.students.data.length}</h3>
      </div>    
    )
  })

  const addNewClass = () => {
    console.log('works')
  }

  return (
    <div className="background">
      <NewClassGroup />
      <div className="class_card__container">
        {classCard}
        <div className="class_card__new" onClick={addNewClass}>
          <h3>+ add new class</h3>
        </div>
      </div>
    </div>
  )
}

export default ClassGroups