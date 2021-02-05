class StaticPagesController < ApplicationController
  def welcome
    image = ActionController::Base.helpers.asset_url("pigs.jpg", type: :image)

    set_meta_tags title: "Kennsch Ethik?", reverse: true,
              description: "Kennsch Ethik? ist ein Portal für Tierethik und Tierschutz-Aktivismus.",
              og: {
                title: :title,
                description: :description,
                url: root_path,
                image: image
              }
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
  end

  def impressum

  end

  def exchange
    
  end
end
