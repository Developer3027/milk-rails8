class InfoController < ApplicationController
  def index
    # Renders the main page with the initial content
  end

  def welcome
    # Renders app/views/info/welcome.html.erb
  end

  def about_me
    # Renders app/views/info/about_me.html.erb
  end

  def contact
    @contact = Contact.new
    # Renders app/views/info/contact.html.erb
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to info_contact_path, notice: "Contact form was successfully completed."
    else
      render :contact, status: :unprocessable_entity
    end
  end

  def skills
    @pills = Pill.all.group_by(&:group)
    @plain_pills = Pill.all
    # Renders app/views/info/skills.html.erb
  end

  def projects
    # Renders app/views/info/projects.html.erb
  end

  def erudition
    # Render app/views/info/erudition.html.erb
  end

  private

  def contact_params
    params.require(:contact).permit(:f_name, :l_name, :email, :description)
  end
end
