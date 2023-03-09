  const ulGenreRef = useRef(null);
  const ulLangRef = useRef(null);

  const handleSubmit = (e) => {
      console.log(ulGenreRef.current.innerText);
      console.log(ulLangRef.current.innerText);
    }
  };


        <DropDown
          array={albums}
          defaultText="Select genre"
          ulRef={ulGenreRef}
        />
        <br></br>
        <DropDown
          array={["English", "Hindi", "Malayalam"]}
          defaultText="Select language"
          ulRef={ulLangRef}
        />
