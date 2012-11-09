module ApplicationHelper
  
  def flash_class(type)
    case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
  
  def background
    if controller.controller_name == "home"
      link = "background"
    end
  end
  
  def us_states
    [
      ["CT", "CT"],
      ["MA", "MA"],
      ["NY", "NY"],
      ["NJ", "NJ"],
      ["PA", "PA"]
     
      ]
  end
  
end
