class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 #  rescue_from NotActivated, :with => :not_activated
 #
 #  def not_activated(exception)
 #   flash[:notice] = "This user is not activated."
 #   redirect_to root_path
 # end




 def authorise_designer
   unless current_organisation && current_organisation.designer?
     redirect_to root_path, alert: "You can't come in since you're not a designer"
   end
 end

 def authorise_printer
   unless current_organisation && current_organisation.printer?
     redirect_to root_path, alert: "You can't come in since you're not a printer"
   end
 end

 def authorise_client
   unless current_organisation && current_organisation.client?
     redirect_to root_path, alert: "You can't come in since you're not a client"
   end
 end

 def authorise_not_designer
   unless current_organisation && current_organisation.printer? ||
     current_organisation && current_organisation.client?
     redirect_to root_path, alert: "You can't come in since you're a designer"
   end
 end

 def authorise_not_printer
   unless current_organisation && current_organisation.designer? ||
     current_organisation && current_organisation.client?
     redirect_to root_path, alert: "You can't come in since you're a printer"
   end
 end

 def authorise_not_client
   unless current_organisation && current_organisation.printer? ||
     current_organisation && current_organisation.designer?
     redirect_to root_path, alert: "You can't come in since you're a client"
   end
 end


  def current_organisation
    @current_org = Organisation.find(session[:organisation_id]) if session[:organisation_id]
  end

  helper_method :current_organisation

  def display_current_organisation
    if current_organisation.present?
      current_organisation.title
    else
      "No current org"
    end
  end

  helper_method :display_current_organisation

end
