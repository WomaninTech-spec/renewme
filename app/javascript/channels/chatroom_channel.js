import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  const messagesContent = document.getElementById('content');
  const input = document.getElementById('message_content');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      connected () {
          console.log('connected')
        },
      received(data) {

        messagesContent.insertAdjacentHTML('beforeend', data);
        input.value = ""
      }
    });
  }
}

export { initChatroomCable };
