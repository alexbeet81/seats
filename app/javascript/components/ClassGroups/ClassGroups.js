import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import './ClassGroups.css';

const ClassGroups = () => {
  const [classGroups, setClassGroups] = useState([])

  useEffect(() => {
    // Get all of the class groups from api
    // update class groups in state

    axios.get('/api/v1/class_groups.json')
    .then( resp => {
      setClassGroups(resp.data.data)
    })
    .catch( resp => console.log(resp))
  }, [classGroups.length])

  const list = classGroups.map( item => {
    return (
      <li key={item.attributes.name}>{item.attributes.name}</li>
    )
  })

  return (
    <div className="background">
      <ul>{list}</ul>
    </div>
  )
}

export default ClassGroups