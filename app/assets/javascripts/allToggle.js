function toggleDiv(div, link, animationIn, animationOut, moveLink, div2){

  if (div.style.display === 'none'){
    if (div2 !== undefined){
      setTimeout(function() {div2.style.display = 'none'}, 200);
      div2.classList.add(animationOut);
      div2.classList.remove(animationIn);
    }
    div.classList.remove(animationOut);
    div.classList.remove(animationIn);
    div.classList.add(animationIn);
    div.style.display = "block"
    link.classList.remove(animationOut);
    link.classList.add(moveLink, animationIn);

  } else if (div.style.display === 'block'){
    if (div2 !== undefined) {
      div2.classList.add(animationIn);
      div2.classList.remove(animationOut);
    }
    div.classList.remove(animationIn);
    div.classList.remove(animationOut);
    div.classList.add(animationOut);
    setTimeout(function() {div.style.display = 'none'}, 200);
    link.classList.remove(moveLink, animationIn);
    link.classList.add(animationOut);
  }
}

function toggleMessages(div, div2, link, moveLink){
  if (div.style.display === 'none'){
    div.classList.remove('slideOutRight');
    div.classList.add('slideInRight');
    div.style.display = "flex";
    div2.classList.remove('slideOutDown');
    div2.classList.add('slideInUp');
    div2.style.display = 'block';
    link.classList.remove('slideOutRight');
    link.classList.add(moveLink, 'slideInRight');
  } else {
    div.classList.remove('slideInRight');
    div.classList.add('slideOutRight');
    div2.classList.remove('slideInUp');
    div2.classList.add('slideOutDown');
    link.classList.remove(moveLink, 'slideInRight');
    link.classList.add('slideOutRight');
    setTimeout(function() {div2.style.display = 'none'}, 200);
    setTimeout(function() {div.style.display = 'none'}, 200);
  }
}
