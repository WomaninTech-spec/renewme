const initMsgUnread = () => {
  const msgUnread = document.getElementById("messages-unread")
  const msgUnreadMenu = document.getElementById("messages-unread-menu")
  fetch(`${ENV["HOST"]}/users/${msgUnread.dataset.userId}/messages/messages-unread`)
    .then(response => response.json())
    .then(data => {
      msgUnread.innerHTML = data.unread;
      msgUnreadMenu.innerHTML = data.unread;
    });
}

export {initMsgUnread}
