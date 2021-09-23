class TestDataController < ApplicationController

  if Rails.env.development?
    def cv_units
      CvUnit.all.destroy_all
    end

    def users
      User.all.destroy_all
    end

    def cvs
      Cv.all.destroy_all
    end
  end
end
