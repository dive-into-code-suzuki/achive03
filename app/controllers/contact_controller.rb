class ContactController < ApplicationController
  def new
   　 @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)

    if @contact.valid?
      @msee=@contact.message.gsub(/\r\n|\r|\n/, "<br />").html_safe
    else
      render action: 'new'
    end
  end

  def thanks
    @contact = Contact.create(contact_params)
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
  
end
