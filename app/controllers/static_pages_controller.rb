class StaticPagesController < ApplicationController
  def welcome
    if params[:flash].present?
      flash[:success] = params[:flash]
    end

    image = ActionController::Base.helpers.asset_url("pigs.jpg", type: :image)

    set_meta_tags title: "Wilkommen", reverse: true,
              description: "Lebensläufe erstellen mit Impulsiv, dem Tool von Impulse",
              og: {
                title: :title,
                description: :description,
                url: root_path,
                image: image
              }

      if params[:user_id].present?
        @user = User.find(params[:user_id])
      elsif user_signed_in?
        @user = current_user
      else
        @user = nil
      end
  end

  def texts
    @page_title       = 'Texte & Argumente'
    @page_description = 'Eine Übersicht aller Texte und Argumente auf Kennsch Ethik?'
    @page_keywords    = 'Tierethik, Argumente'
  end

  def debate_a_vegan
    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render "static_pages/debate_a_vegan", layout: "application_blank"
  end

  def dashboard
    authorize :static_page, :dashboard?
    @support_request = SupportRequest.all

  end

  def impressum

  end

  def exchange

    if params[:flash].present?
      flash[:notice] = params[:flash]
    end

    user_ids = User.includes(:skills).where.not(skills: {id: nil}).pluck(:id)
    user_ids.unshift(current_user.id) unless current_user.blank?
    user_ids.uniq!
    @users = User.where(id: user_ids).sort_by {|m| user_ids.index(m.id)}

  end

  def cv_generator1
    current_user
  end

  def mentoring

  end

end
