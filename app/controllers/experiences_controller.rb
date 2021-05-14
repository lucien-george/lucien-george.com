class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @experiences = policy_scope(Experience)
  end
end
