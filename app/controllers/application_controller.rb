class ApplicationController < ActionController::Base

  #ログイン後の遷移画面(管理者&顧客)
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      customer_show_path
    end
  end

  #ログアウト後の遷移画面(管理者&顧客)
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

end
