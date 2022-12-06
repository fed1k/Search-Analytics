// Config
const token = document.getElementsByName("csrf-token")[0].content;
let arrayOfAnals = {name: '~1z7fe'};
let URL = "http://127.0.0.1:3000/users/"
let headersConfig = {
  "Content-Type": "application/json",
  "X-CSRF-Token": token
}

// Debounce function
const form = document.querySelector('#search');
function debounce(func, timeout = 1000){
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => { func.apply(this, args); }, timeout);
  };
}

// Handle search results
const handleSearch = (searchValue) => {
  const articles = document.querySelectorAll('.article');
  articles.forEach((article)=>{
    if(
      article.firstElementChild.textContent.toLowerCase().includes(searchValue) &&
      article.firstElementChild.textContent.toLowerCase().startsWith(searchValue)
    ){
      article.classList.remove('hide-article')
    }else {
      article.classList.add('hide-article')
    }
  })
}

// If analytics is new or complete, POST else UPDATE
function postAnal(){
  const userParam = window.location.pathname[7] 
  if(form.value && !form.value.toLowerCase().startsWith(arrayOfAnals.name.toLowerCase())) {
    fetch(`${URL + userParam}/anals`, {
      method: 'POST',
      body: JSON.stringify({name: form.value}),
      headers: headersConfig

      // Saving last posted input to keep track of previous value
    }).then((res)=> res.json()).then((data)=> arrayOfAnals = data)
  } else if (form.value && form.value.toLowerCase().startsWith(arrayOfAnals.name.toLowerCase())) {
    fetch(`${URL + userParam}/anals/${arrayOfAnals.id}`, {
      method: 'PUT',
      body: JSON.stringify({name: form.value}),
      headers: headersConfig

      // Saving last posted input to keep track of previous value
    }).then((res)=> res.json()).then((data)=> arrayOfAnals = data)
  }
}

let debounceWrapper = debounce(()=> postAnal())

// Input change event initialization
form.addEventListener('input', (e)=>{
  handleSearch(e.target.value.toLowerCase())
  debounceWrapper()
})

// Profile switch
const acc = document.querySelector('.profile-pic')
const closeBtn = document.querySelector('button[name="close-btn"]')
const modal = document.querySelector('.modal')

acc.addEventListener('click', ()=>{
  modal.showModal()
})

closeBtn.addEventListener('click', ()=>{
  modal.close()
})
