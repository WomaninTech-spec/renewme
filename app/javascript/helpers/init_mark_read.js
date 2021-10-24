const markRead = () => {
  const sendMessage = document.getElementById('send-message');
  if (sendMessage){
    sendMessage.addEventListener('click', (event) => {
      event.preventDefault();
      //setTimeout(2000);
      //console.log('toto');
      fetch(`http://localhost:3000/users/${sendMessage.dataset.userId}/chatrooms/${sendMessage.dataset.chatroomId}/mark-as-read`,
      {
        method: 'POST', // or 'PUT'
        headers: {
          'Content-Type': 'application/json',
        }
      }
      )
      // .then(response => response.json())
      // .then(data => {
      //   console.log('Success:', data);
      // })
    })

  }
}

export { markRead }
