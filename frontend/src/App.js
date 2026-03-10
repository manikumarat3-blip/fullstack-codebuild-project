import React, { useEffect, useState } from "react";

function App() {

  const [products,setProducts] = useState([]);

  useEffect(()=>{
    fetch("http://18.60.225.40:5000/products")
      .then(res=>res.json())
      .then(data=>setProducts(data));
  },[]);

  return(
    <div>
      <h1>Product List</h1>

      {products.map(p=>(
        <p key={p.id}>{p.name}</p>
      ))}

    </div>
  );
}

export default App;
