import React from 'react';

const BookListItem = (props) => {

  return(
    <div className="list-item text-center small-4 columns">
      <h4><a href={`http://localhost:3000/books/` + props.id}>{props.title}</a></h4>
      <p>{props.author}</p>
    </div>
  )
}

export default BookListItem;
