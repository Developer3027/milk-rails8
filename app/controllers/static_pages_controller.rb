class StaticPagesController < ApplicationController
  def index
    @small_projects = Project.order(updated_at: :desc).pluck(:short_title, :short_description).map do |title, description|
      {
        title: title,
        description: description,
        path: "/#{title.parameterize}"
      }
    end
  end

  def info
    @projects = Project.all
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to info_path, notice: "Contact form was successfully completed."
    else
      @projects = Project.all
      render :info # Re-render the info page with error messages
    end
  end

def destroy_contact
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect_to root_path, notice: "Message was successfully deleted."
end

  def resume
    @pills = Pill.all
  end

  private

  def contact_params
    params.require(:contact).permit(:f_name, :l_name, :email, :description)
  end
end
