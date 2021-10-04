import axios from 'axios';
import React, { useState, useEffect } from 'react';

const ClassGroup = () => {
  // API call to find the seating plan for this class group.
  const [seatingChart, setSeatingChart] = useState();
  const [classGroup, setClassGroup] = useState([]);
  const [students, setStudents] = useState();

  useEffect(() => {
    axios.get(`http://localhost:3000/api/v1/class_groups/class-one.json`)
    .then(resp => {
    console.log('I am in useEffect', resp)
      setClassGroup(resp.data.data)
    })
  }, [classGroup.length])

  console.log('I am console log classGroup',typeof classGroup)

  const classInformation = classGroup.map( item => {
    console.log(item)
    return (
      <div>
        hello
      </div>
    )
  })

  return (
    <div></div>
  )
}

export default ClassGroup