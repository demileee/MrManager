function toggleDiv(div, link, animationIn, animationOut, moveLink, div2){

  if (div.style.display === 'none'){
    if (div2 !== undefined){
      setTimeout(function() {div2.style.display = 'none'}, 200)
      div2.classList.add(animationOut)
      div2.classList.remove(animationIn)
    }
    div.classList.remove(animationOut)
    div.classList.remove(animationIn)
    div.classList.add(animationIn)
    div.style.display = "block"
    link.classList.remove(animationIn)
    link.classList.add(moveLink, animationOut)

  } else if (div.style.display === 'block'){
    if (div2 !== undefined) {
      div2.classList.add(animationIn)
      div2.classList.remove(animationOut)
    }
    div.classList.remove(animationIn)
    div.classList.remove(animationOut)
    div.classList.add(animationOut)
    setTimeout(function() {div.style.display = 'none'}, 200)
    link.classList.remove(moveLink, animationOut)
    link.classList.add(animationIn)
  }
}
