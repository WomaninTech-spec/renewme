import consumer from "./consumer";

const initNotificationsCable = () => {
  const notifications = document.getElementById('notifications');

  if (notifications) {
    const id = notifications.dataset.userId;
    consumer.subscriptions.create({ channel: "NotificationsChannel", id: id }, {
      received(data) {
        notifications.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initNotificationsCable };
