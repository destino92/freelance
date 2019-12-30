Trestle.resource(:transactions) do
  remove_action :destroy
  menu do
    item :transactions, icon: "fa fa-money", label: "Withdraw"
  end

  collection do 
    Transaction.withdraw
  end


  table do 
   column :buyer
   column :amount
   column :status
   column :transaction_type
   column :created_at, align: :center

   actions do |toolbar, instance, admin|
    if instance.withdraw? && instance.pending?
      toolbar.link 'Approve', admin.path(:approve, id: instance.id), method: :post, class: 'btn btn-success'
      toolbar.link 'Reject', admin.path(:reject, id: instance.id), method: :post, class: 'btn btn-danger'
    end
    end
   end

   controller do 
    def approve
      transaction = admin.find_instance(params)
      transfer_amount = transaction.amount 
      response = EXPRESS_GATEWAY.transfer(transfer_amount * 100,
                                          transaction.buyer.paypal,
                                          subject: 'Payment from Freelancer',
                                          note: "Withdraw $#{transfer_amount}")


      if response.success?
        ActiveRecord::Base.transaction do 
          transaction.buyer.update!(wallet: transaction.buyer.wallet - transfer_amount)
          transaction.approved!

        end
      flash[:message] = "Transaction is approved"
    end
      redirect_to transactions_admin_index_path
    end
      def reject
      transaction = admin.find_instance(params)
      transaction.reject!

      flash[:message] = "Transaction is rejected"
      redirect_to transactions_admin_index_path
    end

    end

    routes do 
      post :approve, on: :member
      post :reject, on: :member
    end


end
