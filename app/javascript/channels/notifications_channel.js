import consumer from "./consumer";
import { initMsgUnread } from '../helpers/init_msg_unread.js'

const initNotificationsCable = () => {
  const notifications = document.getElementById('notifications');

  if (notifications) {
    const id = notifications.dataset.userId;
    consumer.subscriptions.create({ channel: "NotificationsChannel", id: id }, {
      connected () {
          console.log('connected')
      },
      disconnected () {
          console.log('disconnected')
      },
      received(data) {
        console.log("received dataa")
        notifications.insertAdjacentHTML('beforeend', data);
        initMsgUnread();
      },
    });
  }
}

export { initNotificationsCable };
