import React, { Component } from 'react';
import BookListItem from './BookListItem';

class BookList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      books: [],
      currentPage: 1,
      booksPerPage: 5
    }
    this.getData = this.getData.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }

  getData() {
    fetch('http://localhost:3000/api/v1/books.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({books: body["books"]});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  }

  render() {
    let indexOfLastBook = this.state.currentPage * this.state.booksPerPage;
    let indexOfFirstBook = indexOfLastBook - this.state.booksPerPage;
    let currentBooks = this.state.books.slice(indexOfFirstBook, indexOfLastBook);

    let newBooks = currentBooks.map((book, index) => {
      return (
        <BookListItem
          id={book.id}
          key={index}
          url={book.url}
          title={book.title}
          author={book.author}
        />
      )
    });

    let pageNumbers = [];
    for (let i = 1; i <= Math.ceil(this.state.books.length / this.state.booksPerPage); i++) {
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return (
        <li
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </li>
      );
    });

    return(
      <div className="book-index">
        <h2>Readsgood</h2>
        {newBooks}
        <ul>
          {renderPageNumbers}
        </ul>
      </div>
    )
  }
}

export default BookList;
