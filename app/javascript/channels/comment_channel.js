import consumer from "./consumer"

$(document).on('turbolinks:load', () => {
    $('[data-channel-subscribe="order"]').each(function(index, element) {
        var $element = $(element),
            $chatList = $('#comment-list'),
            $form = $('#new-comment'),
            order_id = $element.data('order-id')

            conversation_id = $element.data('order-id'),
            user_id = $element.data('user-id')

        consumer.subscriptions.create(
            {
                channel: "CommentChannel",
            order: order_id
            },
            {
                received: function(data) {
                      console.log(data.message)
                      $chatList.append(data.message)
                   

                    $form[0].reset();
                    $chatList.animate({ scrollTop: $chatList.prop("scrollHeight") }, 1000)
                }
            }
        )
    });
});