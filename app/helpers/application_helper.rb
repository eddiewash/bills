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
  
  def payment_terms
    [
      ["Payment Due Upon Receipt", 0],
      ["Net 15", 15],
      ["Net 30", 30],
      ["Net 45", 45],
      ["Net 60", 60],
      ]
  end
  
end
