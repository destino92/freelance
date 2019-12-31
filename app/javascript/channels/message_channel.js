import consumer from "./consumer"

$(document).on('turbolinks:load', () => {
    $('[data-channel-subscribe="conversation"]').each(function(index, element) {
        var $element = $(element),
            $chatList = $('#message_list'),
            $form = $('#new_message'),

            conversation_id = $element.data('conversation-id'),
            user_id = $element.data('user-id')

        consumer.subscriptions.create(
            {
                channel: "MessageChannel",
                conversation: conversation_id
            },
            {
                received: function(data) {
                    if (data.sender_id == user_id) {
                        $chatList.append(data.sender)
                    } else {
                        $chatList.append(data.receiver)
                    }

                    $form[0].reset();
                    $chatList.animate({ scrollTop: $chatList.prop("scrollHeight") }, 1000)
                }
            }
        )
    });
});