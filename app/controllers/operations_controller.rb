class OperationsController < ApplicationController

  def new
  end

  private

  def set_user
    @user = current_user
  end

  def operation_params
    # params.require(:operation).permit(:content, :landing_form_id, product_ids: [])
  end
end
