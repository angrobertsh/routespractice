class ContactsController < ApplicationController
  def index
    json = Contact.where(user_id: params[:user_id]).joins(:contact_shares)
    json += Contact.where(user_id: params[:user_id])
    render json: json

  end

  def show
    json = Contact.where(id: params[:id])
    json += Comment.where(person_id: params[:id], person_type: Contact)
    render json: json
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def new_favorite
    contact = Contact.where(user_id: params[:user_id],id: params[:contact_id])
    if contact.update(params[:contact_id], favorite: params[:favorite])
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def favorite_contacts
    json = Contact.where(user_id: params[:user_id], favorite: true)
    json += ContactShare.where(user_id: params[:user_id], favorite: true)
    render json: json
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id, :favorite)
  end

end
